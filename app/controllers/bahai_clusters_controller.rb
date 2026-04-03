class BahaiClustersController < ApplicationController
  include Paginatable
  before_action :set_bahai_cluster, only: [:update]

  SORTABLE_COLUMNS = %w[name milestone active zone region].freeze
  COLUMN_MAP = {
    'name'      => 'bahai_clusters.name',
    'milestone' => 'bahai_clusters.milestone',
    'active'    => 'bahai_clusters.active',
    'zone'      => 'bahai_zones.name',
    'region'    => 'regions.name',
  }.freeze

  def index
    # eager_load keeps both joins available for filtering AND sort-by-association columns
    scope = BahaiCluster.eager_load(bahai_zone: :region)

    scope = scope.where(regions:     { name: params[:region] })   if params[:region].present?
    scope = scope.where(bahai_zones: { name: params[:zone] })     if params[:zone].present?
    scope = scope.where(milestone: params[:milestone])            if params[:milestone].present?
    scope = scope.where(active: params[:active])                  if params[:active].present?

    if params[:paginate] == 'true'
      apply_pagination_and_sort(scope,
        allowed_columns: SORTABLE_COLUMNS,
        column_map:      COLUMN_MAP,
        serializer:      BahaiClusterListSerializer)
    else
      render json: scope.order(:name), each_serializer: BahaiClusterSerializer
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
