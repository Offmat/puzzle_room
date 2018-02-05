class MaterialPolicy < ApplicationPolicy
  def create?
    user
  end
end
