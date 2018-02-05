class CountryPolicy < ApplicationPolicy
  def create?
    user&.admin
  end
end
