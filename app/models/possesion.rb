class Possesion < ApplicationRecord
  validates :status, presence: true
  validates :user, uniqueness: { scope: :puzzle }

  belongs_to :user
  belongs_to :puzzle
end
