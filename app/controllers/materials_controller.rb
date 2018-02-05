class MaterialsController < ApplicationController
  def index
    @materials = Material.all.order(:name)
    @material = Material.new
  end

  def create
    authorize @material = Material.new(material_params)
    if @material.save
      redirect_to materials_path
    else
      render 'index'
    end
  end

  def destroy
    authorize @material = Material.find(params[:id])
    @material.destroy
    redirect_to materials_path
  end

  private

  def material_params
    params.require(:material).permit(:name)
  end
end
