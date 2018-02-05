class InventorPolicy < ApplicationPolicy
  def permitted_attributes
    [:name, :surname, :century, :description, :country_id]
  end

  def create?
    user
  end
end
