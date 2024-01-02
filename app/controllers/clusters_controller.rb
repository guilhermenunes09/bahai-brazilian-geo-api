class ClustersController < ApplicationController
  before_action :set_cluster, only: [:update]
  
  def index
    @clusters = Cluster.all
    render json: @clusters, each_serializer: ClusterSerializer
  end

  def update
    @cluster.update(cluster_params)
    render json: @cluster, each_serializer: ClusterSerializer
  end

  private

  def cluster_params
    params.require(:cluster).permit(:id, :name, :milestone)
  end

  def set_cluster
    @cluster = Cluster.find(params[:id])
  end
end
