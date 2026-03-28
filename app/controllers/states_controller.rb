class StatesController < ApplicationController
  def index
    @states = State.all

    if params[:region].present?
      @states = @states.joins(:region).where(regions: { name: params[:region] })
    end

    render json: @states, each_serializer: StateSerializer
  end
end
