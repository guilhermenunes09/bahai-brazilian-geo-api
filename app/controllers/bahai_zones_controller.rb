class BahaiZonesController < ApplicationController
  include Paginatable

  SORTABLE_COLUMNS = %w[name].freeze
  COLUMN_MAP = { 'name' => 'bahai_zones.name' }.freeze

  def index
    scope = BahaiZone.includes(:region, :bahai_clusters).order(:name)
    scope = scope.joins(:bahai_clusters).distinct if params[:with_clusters] == 'true'

    if params[:paginate] == 'true'
      apply_pagination_and_sort(scope,
        allowed_columns: SORTABLE_COLUMNS,
        column_map:      COLUMN_MAP,
        serializer:      BahaiZoneListSerializer)
    else
      render json: scope, each_serializer: BahaiZoneSerializer
    end
  end
end
