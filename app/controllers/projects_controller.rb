class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :update_config, :map_bundle, :duplicate, :destroy]

  def index
    projects = Project.order(updated_at: :desc)
    render json: projects
  end

  def show
    render json: project_payload(@project)
  end

  def create
    project = Project.new(project_create_params)

    if project.save
      Projects::LayerItemsSeeder.seed(project)
      render json: project_payload(project), status: :created
    else
      render json: { errors: project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_update_params)
      render json: project_payload(@project)
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update_config
    if @project.update(config: config_params.to_h)
      render json: {
        project: project_payload(@project),
        config: @project.merged_config
      }
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    head :no_content
  end

  def map_bundle
    render json: ::Projects::MapBundleBuilder.new(@project).call
  end

  def duplicate
    copy = @project.dup
    copy.name = "#{@project.name} (cópia)"
    copy.slug = unique_slug(copy.name)
    copy.config = @project.config.deep_dup
    copy.created_at = nil
    copy.updated_at = nil

    if copy.save
      @project.project_legends.each do |legend|
        copy.project_legends.create!(
          name: legend.name,
          color: legend.color,
          sort_order: legend.sort_order,
          rules: legend.rules.deep_dup
        )
      end

      # Copy layer items from source project
      rows = @project.project_layer_items.map do |li|
        {
          project_id: copy.id,
          layer_slug: li.layer_slug,
          item_type:  li.item_type,
          item_id:    li.item_id,
          sort_order: li.sort_order,
          created_at: Time.current,
          updated_at: Time.current,
        }
      end
      ProjectLayerItem.insert_all(rows, unique_by: :index_project_layer_items_unique_per_project) if rows.any?

      render json: project_payload(copy), status: :created
    else
      render json: { errors: copy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def unique_slug(name)
    base = name.parameterize
    slug = base
    counter = 2
    while Project.exists?(slug: slug)
      slug = "#{base}-#{counter}"
      counter += 1
    end
    slug
  end

  def project_create_params
    attrs = params.require(:project).permit(
      :name,
      :slug,
      :scope_mode,
      :scope_region_name,
      :scope_country_name,
      :status,
      config: {}
    ).to_h

    attrs[:config] = attrs[:config] || {}
    attrs
  end

  def project_update_params
    params.require(:project).permit(
      :name,
      :slug,
      :scope_mode,
      :scope_region_name,
      :scope_country_name,
      :status
    )
  end

  def config_params
    params.require(:config).permit!
  end

  def project_payload(project)
    {
      id: project.id,
      name: project.name,
      slug: project.slug,
      scope_mode: project.scope_mode,
      scope_region_name: project.scope_region_name,
      scope_country_name: project.scope_country_name,
      status: project.status,
      updated_at: project.updated_at,
      created_at: project.created_at
    }
  end
end
