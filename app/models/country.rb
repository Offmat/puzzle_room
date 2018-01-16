class Country < ApplicationRecord
  validates :name, presence: false, uniqueness: {case_sensitive: false}

end
