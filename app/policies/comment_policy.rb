class CommentPolicy < ApplicationPolicy
  def permitted_attributes
    [:body, :commentable_id, :commentable_type]
  end

  def create?
    true
  end

  def destroy?
    user&.admin || (user && user == record.user)
  end
end
