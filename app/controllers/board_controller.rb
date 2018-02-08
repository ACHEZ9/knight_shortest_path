class BoardController < ApplicationController
  def index
  end

  def shortest_path
    start = params[:start]
    finish = params[:finish]

    @path = KnightShortestPath.new().get_shortest_path(start, finish)

    render json: @path
  end
end
