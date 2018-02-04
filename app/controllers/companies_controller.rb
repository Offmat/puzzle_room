class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]
  before_action :fetch_countries, only: [:new, :edit, :create]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else
      fetch_countries
      render 'new'
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :country_id)
  end

  def fetch_countries
    @countries = Country.all
  end

  def find_company
    @company = Company.find(params[:id])
  end
end
