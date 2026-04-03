class RegionsController < ApplicationController
  include Paginatable
  before_action :set_region, only: [:show, :update]

  SORTABLE_COLUMNS = %w[id name].freeze
  COLUMN_MAP = {
    'id'   => { expr: 'regions.id',   text: false },
    'name' => { expr: 'regions.name', text: true  },
  }.freeze
  SEARCH_MAP = {
    'name' => { expr: 'regions.name', text: true },
  }.freeze

  def index
    scope = Region.all
    scope = scope.where(name: params[:region]) if params[:region].present?

    if params[:paginate] == 'true'
      apply_pagination_and_sort(scope,
        allowed_columns: SORTABLE_COLUMNS,
        column_map:      COLUMN_MAP,
        search_map:      SEARCH_MAP,
        serializer:      RegionListSerializer)
    else
      render json: scope.order(:name), each_serializer: RegionSerializer
    end
  end

  def show
    render json: @region, serializer: RegionSerializer
  end

  def update
    @region.update(region_params)
    render json: @region, serializer: RegionSerializer
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end

  def set_region
    @region = Region.find(params[:id])
  end
end
