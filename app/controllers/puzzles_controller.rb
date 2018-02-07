class PuzzlesController < ApplicationController
  before_action :pre_form, only: [:new, :edit]
  before_action :find_puzzle, only: [:show, :edit, :update, :destroy]

  def index
    @material = Material.find_by(id: params.dig(:q, :material_id))
    @producer = Company.find_by(id: params.dig(:q, :company_id))
    @inventor = Inventor.find_by(id: params.dig(:q, :inventor_id))
    @puzzles = @material.puzzles.includes(:rates).order(:name) if @material
    @puzzles = @producer.puzzles.includes(:rates).order(:name) if @producer
    @puzzles = @inventor.puzzles.includes(:rates).order(:name) if @inventor
    @pre_set = @material || @producer || @inventor
    @puzzles = Puzzle.all.includes(:rates).order(:name) unless @pre_set
  end

  def show
    @possesion = Possesion.find_or_initialize_by(user: current_user, puzzle: @puzzle)
    @rate = Rate.find_or_initialize_by(user: current_user, puzzle: @puzzle)
    @comment = Comment.new
  end

  def new
    if params[:puzzle]
      @puzzle = Puzzle.new(permitted_attributes(Puzzle).merge(level: 0))
    else
      @puzzle = Puzzle.new(level: 0)
    end
  end

  def create
    authorize @puzzle = Puzzle.new(permitted_attributes(Puzzle))
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
    authorize @puzzle
    if @puzzle.update(permitted_attributes(@puzzle))
      redirect_to @puzzle
    else
      pre_form
      render 'edit'
    end
  end

  def destroy
    authorize @puzzle
    @puzzle.destroy
    redirect_to puzzles_path
  end

  private

  def pre_form
    @producers = Company.all
    @materials = Material.all
    @inventors = Inventor.all
  end

  def find_puzzle
    @puzzle = Puzzle.find(params[:id])
  end
end
