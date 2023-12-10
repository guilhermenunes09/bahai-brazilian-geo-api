class CountriesController < ApplicationController
  def index
    @countries = Country.all
    render json: @countries, each_serializer: CountrySerializer
  end
end
