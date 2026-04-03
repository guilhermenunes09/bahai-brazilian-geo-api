class StatesController < ApplicationController
  include Paginatable
  before_action :set_state, only: [:show]

  SORTABLE_COLUMNS = %w[id name region].freeze
  COLUMN_MAP = {
    'id'     => { expr: 'states.id',    text: false },
    'name'   => { expr: 'states.name',  text: true  },
    'region' => { expr: 'regions.name', text: true  },
  }.freeze
  SEARCH_MAP = {
    'name'   => { expr: 'states.name',  text: true },
    'region' => { expr: 'regions.name', text: true },
  }.freeze

  def index
    scope = State.eager_load(:region)

    if params[:region].present?
      scope = scope.where(regions: { name: params[:region] })
    end

    if params[:paginate] == 'true'
      apply_pagination_and_sort(scope,
        allowed_columns: SORTABLE_COLUMNS,
        column_map:      COLUMN_MAP,
        search_map:      SEARCH_MAP,
        serializer:      StateListSerializer)
    else
      render json: scope.order(:name), each_serializer: StateSerializer
    end
  end

  def show
    render json: @state, serializer: StateSerializer
  end

  private

  def set_state
    @state = State.find(params[:id])
  end
end
