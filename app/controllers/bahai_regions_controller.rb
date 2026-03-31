class BahaiRegionsController < ApplicationController
  def index
    @bahai_regions = BahaiRegion.all
    render json: @bahai_regions, each_serializer: BahaiRegionSerializer
  end
end
