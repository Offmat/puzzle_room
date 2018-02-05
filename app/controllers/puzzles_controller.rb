class PuzzlesController < ApplicationController
  before_action :pre_form, only: [:new, :edit]
  before_action :find_puzzle, only: [:show, :edit, :update, :destroy]

  def index
    @puzzles = Puzzle.all.order(:name)
    material_id = params.dig(:q, :material_id)
    company_id = params.dig(:q, :company_id)
    inventor_id = params.dig(:q, :inventor_id)
    @puzzles = @puzzles.joins(:materials).where(materials: {id: material_id}) if material_id
    @puzzles = @puzzles.joins(:producer).where(companies: {id: company_id}) if company_id
    @puzzles = @puzzles.joins(:inventor).where(inventors: {id: inventor_id}) if inventor_id
    @pre_set = {puzzle: params.require(:q).permit!} if params[:q]
  end

  def show
    @possesion = Possesion.find_or_initialize_by(user: current_user, puzzle: @puzzle)
    @rate = Rate.new
    @comment = Comment.new
  end

  def new
    @puzzle = Puzzle.new(level: 0)
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
    if @puzzle.save
      redirect_to @puzzle
    else
      pre_form
      render 'new'
    end
  end

  def edit
  end

  def update
    if @puzzle.update(puzzle_params)
      redirect_to @puzzle
    else
      pre_form
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
