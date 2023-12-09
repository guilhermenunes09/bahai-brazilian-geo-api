class StatesController < ApplicationController
  def index
    @states = State.all
    render json: @states, each_serializer: StateSerializer
  end
end
