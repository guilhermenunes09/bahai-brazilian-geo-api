class ClustersController < ApplicationController
  def index
    @clusters = Cluster.includes(:zone)

    if params[:region].present?
      @clusters = @clusters.joins(zone: :region).where(regions: { name: params[:region] })
    end

    render json: @clusters, each_serializer: ClusterSerializer
  end
end
