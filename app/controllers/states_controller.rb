class StatesController < ApplicationController
  def index
    region_query = params[:region]

    if region_query.present?
      region = Region.find_by(name: region_query)
      
      if region
        @states = State.where(region: region)
      else
        render json: { error: "Region not found" }, status: :not_found
        return
      end
    else
      @states = State.all
    end

    render json: @states, each_serializer: StateSerializer
  end
end
