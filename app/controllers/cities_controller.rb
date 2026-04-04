class CitiesController < ApplicationController
  include Paginatable
  before_action :set_city, only: [:show, :update]

  SORTABLE_COLUMNS = %w[id name state region].freeze
  COLUMN_MAP = {
    'id'     => { expr: 'cities.id',     text: false },
    'name'   => { expr: 'cities.name',   text: true  },
    'state'  => { expr: 'states.name',   text: true  },
    'region' => { expr: 'regions.name',  text: true  },
  }.freeze
  SEARCH_MAP = {
    'name'   => { expr: 'cities.name',  text: true },
    'state'  => { expr: 'states.name',  text: true },
    'region' => { expr: 'regions.name', text: true },
  }.freeze

  def index
    scope = City.eager_load(state: :region)
    if params[:paginate] == 'true'
      apply_pagination_and_sort(scope,
        allowed_columns: SORTABLE_COLUMNS,
        column_map:      COLUMN_MAP,
        search_map:      SEARCH_MAP,
        serializer:      CityListSerializer)
    else
      render json: scope.order(:name), each_serializer: CitySerializer
    end
  end

  def show
    render json: @city, serializer: CitySerializer
  end

  def update
    @city.update(city_params)
    render json: @city, serializer: CitySerializer
  end

  private

  def city_params
    params.require(:city).permit(:name, :bahai_cluster_id)
  end

  def set_city
    @city = City.find(params[:id])
  end
end
