class InventorsController < ApplicationController
  before_action :find_inventor, only: [:show, :edit, :update, :destroy]
  before_action :fetch_countries, only: [:new, :edit]

  def index
    @inventors = Inventor.all
  end

  def show
  end

  def new
    @inventor = Inventor.new
  end

  def create
    authorize @inventor = Inventor.new(permitted_attributes(Inventor))
    if @inventor.save
      redirect_to inventors_path
    else
      fetch_countries
      render 'new'
    end
  end

  def update
    authorize @inventor
    if @inventor.update(permitted_attributes(@inventor))
      redirect_to @inventor
    else
      render 'edit'
    end
  end

  def destroy
    authorize @inventor
    @inventor.destroy
    redirect_to inventors_path
  end

  private

  def fetch_countries
    @countries = Country.all
  end

  def find_inventor
    @inventor = Inventor.find(params[:id])
  end
end
