class ClustersController < ApplicationController
  def index
    @clusters = Cluster.all
    render json: @clusters, each_serializer: ClusterSerializer
  end
end
