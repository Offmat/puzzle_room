class PuzzlePolicy < ApplicationPolicy
  def create?
    user
  end
end
