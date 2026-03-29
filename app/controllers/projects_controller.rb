class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :update_config, :map_bundle]

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
    merged = @project.config.deep_merge(config_params.to_h)

    if @project.update(config: merged)
      render json: {
        project: project_payload(@project),
        config: @project.merged_config
      }
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def map_bundle
    render json: ::Projects::MapBundleBuilder.new(@project).call
  end

  private

  def set_project
    @project = Project.find(params[:id])
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
