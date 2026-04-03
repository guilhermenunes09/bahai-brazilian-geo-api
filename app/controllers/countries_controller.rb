class CountriesController < ApplicationController
  include Paginatable
  before_action :set_country, only: [:show]

  SORTABLE_COLUMNS = %w[id name].freeze
  COLUMN_MAP = {
    'id'   => { expr: 'countries.id',   text: false },
    'name' => { expr: 'countries.name', text: true  },
  }.freeze
  SEARCH_MAP = {
    'name' => { expr: 'countries.name', text: true },
  }.freeze

  def index
    scope = Country.all

    if params[:paginate] == 'true'
      apply_pagination_and_sort(scope,
        allowed_columns: SORTABLE_COLUMNS,
        column_map:      COLUMN_MAP,
        search_map:      SEARCH_MAP,
        serializer:      CountryListSerializer)
    else
      render json: scope.order(:name), each_serializer: CountrySerializer
    end
  end

  def show
    render json: @country, serializer: CountrySerializer
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end
end
