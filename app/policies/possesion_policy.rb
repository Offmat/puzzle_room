class PossesionPolicy < ApplicationPolicy
  def permitted_attributes
    [:status, :puzzle_id]
  end

  def create?
    user
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
