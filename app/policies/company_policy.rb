class CompanyPolicy < ApplicationPolicy
  def permitted_attributes
    [:name, :description, :country_id]
  end

  def create?
    user
  end
end
