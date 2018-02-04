class Company < ApplicationRecord
validates :name, presence: true
validates :country, presence: {message: "need to be chosen"}

belongs_to :country, optional: true
has_many :puzzles
end
