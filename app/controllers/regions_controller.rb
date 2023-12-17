class RegionsController < ApplicationController
  def index
    region_query = params[:region]

    if region_query.present?
      @regions = Region.where(name: region_query)
      
    else
      @regions = Region.all
    end

    render json: @regions, each_serializer: RegionSerializer
  end
end
