class BahaiZonesController < ApplicationController
  include Paginatable

  SORTABLE_COLUMNS = %w[id name].freeze
  COLUMN_MAP = {
    'id'   => { expr: 'bahai_zones.id',   text: false },
    'name' => { expr: 'bahai_zones.name', text: true  },
  }.freeze
  SEARCH_MAP = {
    'name'   => { expr: 'bahai_zones.name', text: true },
    'region' => { expr: 'regions.name',     text: true },
  }.freeze

  def index
    # eager_load :region so WHERE/ORDER on regions.name works without a separate query
    scope = BahaiZone.eager_load(:region).includes(:bahai_clusters)
    scope = scope.where(id: BahaiZone.joins(:bahai_clusters).select(:id)) if params[:with_clusters] == 'true'

    if params[:paginate] == 'true'
      apply_pagination_and_sort(scope,
        allowed_columns: SORTABLE_COLUMNS,
        column_map:      COLUMN_MAP,
        search_map:      SEARCH_MAP,
        serializer:      BahaiZoneListSerializer)
    else
      render json: scope, each_serializer: BahaiZoneSerializer
    end
  end
end
