class Country < ApplicationRecord
  searchkick
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :companies
  has_many :inventors
end
