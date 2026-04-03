class BahaiClustersController < ApplicationController
  include Paginatable
  before_action :set_bahai_cluster, only: [:show, :update]

  SORTABLE_COLUMNS = %w[id name milestone active zone region].freeze
  COLUMN_MAP = {
    'id'        => { expr: 'bahai_clusters.id',        text: false },
    'name'      => { expr: 'bahai_clusters.name',      text: true  },
    'milestone' => { expr: 'bahai_clusters.milestone', text: false },
    'active'    => { expr: 'bahai_clusters.active',    text: false },
    'zone'      => { expr: 'bahai_zones.name',         text: true  },
    'region'    => { expr: 'regions.name',             text: true  },
  }.freeze
  SEARCH_MAP = {
    'name'      => { expr: 'bahai_clusters.name', text: true  },
    'milestone' => { expr: 'bahai_clusters.milestone', text: false },
    'zone'      => { expr: 'bahai_zones.name',    text: true  },
    'region'    => { expr: 'regions.name',        text: true  },
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
        search_map:      SEARCH_MAP,
        serializer:      BahaiClusterListSerializer)
    else
      render json: scope.order(:name), each_serializer: BahaiClusterSerializer
    end
  end

  def show
    render json: @bahai_cluster, serializer: BahaiClusterSerializer
  end

  def update
    @bahai_cluster.update(bahai_cluster_params)
    render json: @bahai_cluster, serializer: BahaiClusterSerializer
  end

  private

  def bahai_cluster_params
    params.require(:bahai_cluster).permit(:id, :name, :milestone, :active)
  end

  def set_bahai_cluster
    @bahai_cluster = BahaiCluster.find(params[:id])
  end
end
