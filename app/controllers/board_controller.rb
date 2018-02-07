class BoardController < ApplicationController
  def index
  end

  def shortest_path
    start = params[:start].map(&:to_i)
    finish = params[:finish].map(&:to_i)

    @path = KnightShortestPath.new().get_shortest_path(start, finish)

    render json: @path
  end
end
