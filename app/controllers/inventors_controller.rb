class InventorsController < ApplicationController
  before_action :find_inventor, only: [:show, :edit, :update, :destroy]
  before_action :pre_form, only: [:new, :edit, :create]

  def index
    @model = Inventor.all
    render 'common/index'
  end

  def show
  end

  def new
    @inventor = Inventor.new
  end

  def create
    @inventor = Inventor.new(inventor_params)
    if @inventor.save
      redirect_to inventors_path
    else
      render 'new'
    end
  end

  def update
    if @inventor.update(inventor_params)
      redirect_to @inventor
    else
      render 'edit'
    end
  end

  def destroy
    @inventor = Inventor.find(params[:id])
    @inventor.destroy
    redirect_to inventors_path
  end

  private

  def inventor_params
    params.require(:inventor).permit(:name, :surname, :century, :description, :country_id)
  end

  def pre_form
    @countries = Country.all
  end

  def find_inventor
    @inventor = Inventor.find(params[:id])
  end
end
