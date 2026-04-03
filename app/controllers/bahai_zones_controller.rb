class BahaiZonesController < ApplicationController
  include Paginatable

  SORTABLE_COLUMNS = %w[id name].freeze
  COLUMN_MAP = {
    'id'   => { expr: 'bahai_zones.id',   text: false },
    'name' => { expr: 'bahai_zones.name', text: true  },
  }.freeze

  def index
    scope = BahaiZone.includes(:region, :bahai_clusters).order(:name)
    scope = scope.where(id: BahaiZone.joins(:bahai_clusters).select(:id)) if params[:with_clusters] == 'true'

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
