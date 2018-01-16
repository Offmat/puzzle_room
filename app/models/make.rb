class Make < ApplicationRecord
  validates :puzzle, uniqueness: { scope: :material }

  belongs_to :puzzle
  belongs_to :material
end
