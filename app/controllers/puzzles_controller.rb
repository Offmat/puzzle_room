class PuzzlesController < ApplicationController
  before_action :pre_form, only: [:new, :edit]
  before_action :find_puzzle, only: [:show, :edit, :update, :destroy]

  def index
    @material = Material.find_by(id: params.dig(:ql, :material_id))
    @producer = Company.find_by(id: params.dig(:ql, :company_id))
    @inventor = Inventor.find_by(id: params.dig(:ql, :inventor_id))
    @puzzles = @material.puzzles.includes(:rates).order(:name) if @material
    @puzzles = @producer.puzzles.includes(:rates).order(:name) if @producer
    @puzzles = @inventor.puzzles.includes(:rates).order(:name) if @inventor
    @pre_set = @material || @producer || @inventor

    if !@pre_set
      @q = params.dig(:puzzle, :q) if params.dig(:puzzle, :q) != ''
      if @q
        @puzzles = Puzzle.search(@q, fields: [:name, :inventor, :producer],
          misspellings: true).results.sort_by(&:name)
        @puzzles += Puzzle.search(@q, fields: [:name, :inventor, :producer],
          match: :word_middle, misspellings: false).results.sort_by(&:name)
        @puzzles.uniq!
      else
        @puzzles = Puzzle.all.order(:name)
      end
    end
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
