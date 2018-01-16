class Puzzle < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :makes
  has_many :materials, through: :makes
  belongs_to :inventor, optional: true
  belongs_to :producer, foreign_key: 'company_id', class_name: 'Company'
end
