class Possesion < ApplicationRecord
  validates :rating, presence: true

  belongs_to :user
  belongs_to :puzzle
end
