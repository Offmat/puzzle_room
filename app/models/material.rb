class Material < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  before_validation :capitalize_name

  has_many :makes
  has_many :puzzles, through: :makes

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
