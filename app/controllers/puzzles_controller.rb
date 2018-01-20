class PuzzlesController < ApplicationController
  def new
    @puzzle = Puzzle.new
    @producers = Company.all
    @materials = Material.all
    @inventors = Inventor.all
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
    if @puzzle.save
      redirect_to @puzzle
    else
      render 'new'
    end
  end

  def index
    @puzzles = Puzzle.all
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:name, :description, :level, :company_id, :material_ids)
  end
end
