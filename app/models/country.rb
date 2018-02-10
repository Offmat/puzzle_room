class Country < ApplicationRecord
  searchkick word_middle: [:name]
  def search_data
    {
      name: name,
    }
  end
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :companies
  has_many :inventors
end
