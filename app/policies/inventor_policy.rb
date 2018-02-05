class InventorPolicy < ApplicationPolicy
  def create?
    user
  end
end
