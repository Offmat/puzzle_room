class Material < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :makes
  has_many :puzzles, through: :makes
end
