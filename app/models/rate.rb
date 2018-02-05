class Rate < ApplicationRecord
  validates :rating, presence: true
  validates :user, uniqueness: { scope: :puzzle }

  belongs_to :user
  belongs_to :puzzle
end
