class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def new
    @puzzle = Puzzle.new
    @producers = Company.all
    @materials = Material.all
    @inventors = Inventor.all
  end

  def create
    binding.pry
    @puzzle = Puzzle.new(puzzle_params)
    if @puzzle.save
      redirect_to @puzzle
    else
      render 'new'
    end
  end


  private

  def puzzle_params
    params.require(:puzzle).permit(:name, :description, :level, :company_id, :inventor_id, :design_year, :material_ids => [])
  end
end
