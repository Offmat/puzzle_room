class UserPolicy < ApplicationPolicy

  def index?
    user
  end

  def show?
    user
  end

  def update?
    user == record
  end
end
