class ZonesController < ApplicationController
  def index
    @zones = Zone.all

    if params[:region].present?
      @zones = @zones.joins(:region).where(regions: { name: params[:region] })
    end

    render json: @zones, each_serializer: ZoneSerializer
  end
end
