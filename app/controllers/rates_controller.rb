class RatesController < ApplicationController
  def create
    authorize Rate
    @rate = Rate.new(permitted_attributes(Rate).merge(user: current_user))
    if @rate.save
      redirect_to @rate.puzzle, notice: "Rate added"
    else
      redirect_to @rate.puzzle, alert: "Error occured"
    end
  end

  def destroy
    authorize @rate = Rate.find(params[:id])
    @rate.destroy
    redirect_to @rate.puzzle, notice: "Rate deleted"
  end
end
