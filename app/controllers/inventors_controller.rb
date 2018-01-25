class InventorsController < ApplicationController
  before_action :find_inventor, only: [:show, :edit, :update, :destroy]
  before_action :pre_form, only: [:new, :edit]

  def index
    @inventors = Inventor.all
  end

  def new
  end

  def create
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
