class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]
  before_action :fetch_countries, only: [:new, :edit]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    authorize @company = Company.new(permitted_attributes(Company))
    if @company.save
      redirect_to companies_path
    else
      fetch_countries
      render 'new'
    end
  end

  def edit
  end

  def update
    authorize @company
    if @company.update(permitted_attributes(@company))
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    authorize @company
    @company.destroy
    redirect_to companies_path
  end

  private

  def fetch_countries
    @countries = Country.all
  end

  def find_company
    @company = Company.find(params[:id])
  end
end
