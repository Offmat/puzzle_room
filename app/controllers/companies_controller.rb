class CompaniesController < ApplicationController
  before_action :find_company, only: [:show, :edit, :update, :destroy]
  before_action :pre_form, only: [:new, :edit]

  def index
    @model = Company.all
    render 'common/index'
  end

  def new
  end

  def create
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
