class Company < ApplicationRecord
validates :name, presence: true

belongs_to :country
end
