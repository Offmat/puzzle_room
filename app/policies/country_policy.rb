class CountryPolicy < ApplicationPolicy
  def permitted_attributes
    [:name]
  end

  def create?
    user&.admin
  end
end
