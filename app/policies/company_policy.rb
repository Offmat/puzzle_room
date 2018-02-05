class CompanyPolicy < ApplicationPolicy
  def create?
    user
  end
end
