class CountriesController < ApplicationController
  def index
    @countries = Country.all.order(:name)
    @country = Country.new
  end

  def create
    authorize @country = Country.new(country_params)
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

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
