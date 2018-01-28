class Inventor < ApplicationRecord
  validates :name, presence: true

  belongs_to :country, optional: true
  has_many :puzzles

  def full_name
    "#{name} #{surname}"
  end
end
