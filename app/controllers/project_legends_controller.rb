class ProjectLegendsController < ApplicationController
  before_action :set_project, only: [:index, :create]
  before_action :set_legend, only: [:update, :destroy]

  def index
    legends = @project.project_legends.order(:sort_order)
    render json: legends, each_serializer: ProjectLegendSerializer
  end

  def create
    legend = @project.project_legends.new(legend_params)

    if legend.save
      render json: legend, serializer: ProjectLegendSerializer, status: :created
    else
      render json: { errors: legend.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @legend.update(legend_params)
      render json: @legend, serializer: ProjectLegendSerializer
    else
      render json: { errors: @legend.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @legend.destroy
    head :no_content
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_legend
    @legend = ProjectLegend.find(params[:id])
  end

  def legend_params
    params.require(:project_legend).permit(:name, :color, :sort_order, rules: [:layer, :attribute, :value])
  end
end
