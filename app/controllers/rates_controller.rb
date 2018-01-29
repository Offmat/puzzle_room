class RatesController < ApplicationController
  def create
    @puzzle = Puzzle.find(params[:rate][:puzzle_id])
    @rate = Rate.new(puzzle: @puzzle, user: current_user, rating: rate_params[:rating])
    @rate.save
    redirect_to @puzzle
  end

  private

  def rate_params
    params.require(:rate).permit(:rating)
  end
end
