class CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: @cities, each_serializer: CitySerializer
  end
end
