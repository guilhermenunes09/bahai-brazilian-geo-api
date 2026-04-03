class BahaiRegionsController < ApplicationController
  include Paginatable
  before_action :set_bahai_region, only: [:show]

  SORTABLE_COLUMNS = %w[id name slug].freeze
  COLUMN_MAP = {
    'id'   => { expr: 'bahai_regions.id',   text: false },
    'name' => { expr: 'bahai_regions.name', text: true  },
    'slug' => { expr: 'bahai_regions.slug', text: false },
  }.freeze
  SEARCH_MAP = {
    'name' => { expr: 'bahai_regions.name', text: true },
    'slug' => { expr: 'bahai_regions.slug', text: false },
  }.freeze

  def index
    scope = BahaiRegion.all
    if params[:paginate] == 'true'
      apply_pagination_and_sort(scope,
        allowed_columns: SORTABLE_COLUMNS,
        column_map:      COLUMN_MAP,
        search_map:      SEARCH_MAP,
        serializer:      BahaiRegionListSerializer)
    else
      render json: scope.order(:name), each_serializer: BahaiRegionSerializer
    end
  end

  def show
    render json: @bahai_region, serializer: BahaiRegionSerializer
  end

  private

  def set_bahai_region
    @bahai_region = BahaiRegion.find(params[:id])
  end
end
