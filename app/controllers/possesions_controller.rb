class PossesionsController < ApplicationController
  def create
    @possesion = Possesion.find_or_initialize_by(permitted_attributes(Possesion).merge(user: current_user))
    if possesion_params[:status] == "Reset"
      redirect_to @possesion.puzzle, notice: "Nothing was deleted, the void getting vaster"
    elsif @possesion.save
      redirect_to @possesion.puzzle, notice: "Possesion was set"
    else
      redirect_to @possesion.puzzle, alert: "Error occured"
    end
  end

  def update
    authorize @possesion = Possesion.find_by(puzzle_id: permitted_attributes(Possesion)[:puzzle_id], user: current_user)
    if possesion_params[:status] == "Reset"
      authorize @possesion, :destroy?
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
