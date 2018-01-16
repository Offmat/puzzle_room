class Puzzle < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :material
  belongs_to :inventor
  belongs_to :producer, foreign_key: "company_id", class_name: "Company"
end
