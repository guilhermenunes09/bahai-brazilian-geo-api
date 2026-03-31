class BahaiZonesController < ApplicationController
  def index
    @bahai_zones = BahaiZone.all
    render json: @bahai_zones, each_serializer: BahaiZoneSerializer
  end
end
