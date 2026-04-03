class ProjectLayerItemsController < ApplicationController
  before_action :set_project

  def index
    items = @project.project_layer_items.order(:layer_slug, :sort_order)
    render json: items
  end

  def create
    item = @project.project_layer_items.build(layer_item_params)

    if item.save
      record = Projects::LayerItemResolver.resolve(item)
      render json: {
        project_layer_item: {
          id:         item.id,
          layer_slug: item.layer_slug,
          item_type:  item.item_type,
          item_id:    item.item_id,
        },
        record: record
      }, status: :created
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    item = @project.project_layer_items.find(params[:id])
    item.destroy
    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def layer_item_params
    params.require(:project_layer_item).permit(:layer_slug, :item_type, :item_id, :sort_order)
  end
end
