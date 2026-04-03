class BahaiZonesController < ApplicationController
  def index
    scope = BahaiZone.includes(:region, :bahai_clusters).order(:name)
    scope = scope.joins(:bahai_clusters).distinct if params[:with_clusters] == 'true'

    if params[:paginate] == 'true'
      per_page = [[( params[:per_page] || 20).to_i, 1].max, 100].min
      page     = [[params[:page].to_i, 1].max, 1].max
      total_count = scope.count
      total_pages = [(total_count.to_f / per_page).ceil, 1].max
      records = scope.limit(per_page).offset((page - 1) * per_page)
      render json: {
        data: records.map { |r| BahaiZoneListSerializer.new(r).as_json },
        meta: {
          total_count: total_count,
          page: page,
          per_page: per_page,
          total_pages: total_pages
        }
      }
    else
      render json: scope, each_serializer: BahaiZoneSerializer
    end
  end
end
