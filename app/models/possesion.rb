class Possesion < ApplicationRecord
  validates :status, presence: true

  belongs_to :user
  belongs_to :puzzle
end
