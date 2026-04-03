class BahaiClustersController < ApplicationController
  before_action :set_bahai_cluster, only: [:update]

  def index
    scope = BahaiCluster.includes(bahai_zone: :region).order(:name)

    if params[:region].present?
      scope = scope.joins(bahai_zone: :region).where(regions: { name: params[:region] })
    end

    if params[:zone].present?
      scope = scope.joins(:bahai_zone).where(bahai_zones: { name: params[:zone] })
    end

    if params[:milestone].present?
      scope = scope.where(milestone: params[:milestone])
    end

    if params[:active].present?
      scope = scope.where(active: params[:active])
    end

    if params[:paginate] == 'true'
      per_page = [[( params[:per_page] || 20).to_i, 1].max, 100].min
      page = [[params[:page].to_i, 1].max, 1].max
      total_count = scope.count
      total_pages = [(total_count.to_f / per_page).ceil, 1].max
      records = scope.limit(per_page).offset((page - 1) * per_page)
      render json: {
        data: records.map { |r| BahaiClusterListSerializer.new(r).as_json },
        meta: {
          total_count: total_count,
          page: page,
          per_page: per_page,
          total_pages: total_pages
        }
      }
    else
      render json: scope, each_serializer: BahaiClusterSerializer
    end
  end

  def update
    @bahai_cluster.update(bahai_cluster_params)
    render json: @bahai_cluster, each_serializer: BahaiClusterSerializer
  end

  private

  def bahai_cluster_params
    params.require(:bahai_cluster).permit(:id, :name, :milestone)
  end

  def set_bahai_cluster
    @bahai_cluster = BahaiCluster.find(params[:id])
  end
end
