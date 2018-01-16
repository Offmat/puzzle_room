class Country < ApplicationRecord
  validates :name, presence: false, uniqueness: {case_sensitive: false}

  has_many :companies
end
