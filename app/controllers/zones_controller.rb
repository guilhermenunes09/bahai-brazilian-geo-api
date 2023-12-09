class ZonesController < ApplicationController
  def index
    @zones = Zone.all
    render json: @zones, each_serializer: ZoneSerializer
  end
end
