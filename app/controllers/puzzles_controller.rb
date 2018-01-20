class PuzzlesController < ApplicationController
  before_action :pre_form, only: [:new, :edit]
  before_action :find_puzzle, only: [:show, :edit, :update, :destroy]

  def index
    @puzzles = Puzzle.all
  end

  def show
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
  end

  def update
    if @puzzle.update(puzzle_params)
      redirect_to @puzzle
    else
      render 'edit'
    end
  end

  def destroy
    @puzzle.destroy
    redirect_to puzzles_path
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

  def find_puzzle
    @puzzle = Puzzle.find(params[:id])
  end
end
