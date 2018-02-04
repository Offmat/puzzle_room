class PossesionsController < ApplicationController
  def create
    @possesion = Possesion.find_or_initialize_by(possesion_params.merge(user: current_user))
    if possesion_params[:status] == "Reset"
      redirect_to @possesion.puzzle, notice: "Nothing was deleted, the void getting vaster"
    elsif @possesion.save
      redirect_to @possesion.puzzle, notice: "Possesion was set"
    else
      redirect_to @possesion.puzzle, alert: "Error occured"
    end
  end

  def update
    @possesion = Possesion.find_by(user: current_user, puzzle_id: params[:possesion][:puzzle_id])
    if possesion_params[:status] == "Reset"
      @possesion.delete
      redirect_to @possesion.puzzle, notice: "Possesion was deleted"
    elsif @possesion.update(possesion_params)
      redirect_to @possesion.puzzle, notice: "Possesion was updated"
    else
      redirect_to @possesion.puzzle, alert: "Error occured"
    end
  end

  private

  def possesion_params
    params.require(:possesion).permit(:status, :puzzle_id)
  end
end
