class MaterialPolicy < ApplicationPolicy
  def permitted_attributes
    [:name]
  end

  def create?
    user
  end
end
