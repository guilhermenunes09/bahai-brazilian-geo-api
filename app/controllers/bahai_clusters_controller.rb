class BahaiClustersController < ApplicationController
  before_action :set_bahai_cluster, only: [:update]
  
  def index
    @bahai_clusters = BahaiCluster.includes(bahai_zone: :bahai_region)

    if params[:region].present?
      @bahai_clusters = @bahai_clusters.joins(bahai_zone: :region).where(regions: { name: params[:region] })
    end

    render json: @bahai_clusters, each_serializer: BahaiClusterSerializer
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
