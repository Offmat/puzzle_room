class PuzzlePolicy < ApplicationPolicy
  def permitted_attributes
    [:name, :description, :level, :company_id, :inventor_id, :design_year,:avatar, :material_ids => []]
  end

  def create?
    user
  end
end
