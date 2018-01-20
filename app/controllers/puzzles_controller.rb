class PuzzlesController < ApplicationController
  before_action :pre_form, only: [:new, :edit]
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def new
    @puzzle = Puzzle.new
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
    if @puzzle.save
      redirect_to @puzzle
    else
      render 'new'
    end
  end

  def edit
    @puzzle = Puzzle.find(params[:id])
  end

  def update
    @puzzle = Puzzle.find(params[:id])
    if @puzzle.update(puzzle_params)
      redirect_to @puzzle
    else
      render 'edit'
    end
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:name, :description, :level, :company_id, :inventor_id, :design_year, :material_ids => [])
  end

  def pre_form
    @producers = Company.all
    @materials = Material.all
    @inventors = Inventor.all
  end
end
