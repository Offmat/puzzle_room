class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]
  before_action :pre_form, only: [:new, :edit, :create]

  def index
    @model = Company.all
    render 'common/index'
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
      render 'new'
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

  def pre_form
    @countries = Country.all
  end

  def find_company
    @company = Company.find(params[:id])
  end
end
