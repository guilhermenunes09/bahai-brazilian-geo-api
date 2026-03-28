class RegionsController < ApplicationController
  def index
    @regions = Region.all

    if params[:region].present?
      @regions = @regions.where(name: params[:region])
    end

    render json: @regions, each_serializer: RegionSerializer
  end
end
