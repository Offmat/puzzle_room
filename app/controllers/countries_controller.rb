class CountriesController < ApplicationController
  def index
    @q = params[:q] if params[:q] != ''
    @countries = Country.search (@q || '*'), fields: [:name], match: :word_middle, order: :name
    @country = Country.new
  end

  def create
    authorize @country = Country.new(permitted_attributes(Country))
    if @country.save
      redirect_to countries_path
    else
      fetch_countries
      render 'index'
    end
  end

  def destroy
    authorize @country = Country.find(params[:id])
    @country.destroy
    redirect_to countries_path
  end
end
