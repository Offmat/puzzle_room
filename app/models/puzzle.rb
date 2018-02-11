class Puzzle < ApplicationRecord
  searchkick word_middle: [:name, :inventor, :producer]

  attr_accessor :avatar, :remove_avatar
  mount_uploader :avatar, PuzzleAvatarUploader

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :level, presence: true, inclusion: { in: 1..6, message: "is not in range 1-6" }
  validates :producer, presence: {message: "need to be chosen"}

  has_many :makes, dependent: :destroy
  has_many :materials, through: :makes
  belongs_to :inventor, optional: true
  belongs_to :producer, foreign_key: 'company_id', class_name: 'Company', optional: true

  has_many :possesions, dependent: :destroy
  has_many :owners, through: :possesions, source: :user

  has_many :rates, dependent: :destroy
  has_many :users, through: :rates

  has_many :comments, as: :commentable
  has_many :commenters, through: :comments, source: :user

  def search_data
    {
      name: name,
      inventor: inventor&.full_name,
      producer: producer.name
    }
  end

  scope :most_popular_producers, -> { joins(:producer).group("companies.id")
    .select("count(*) as pcount, companies.name").order("pcount DESC") }
  scope :most_popular_inventors, -> { joins(:inventor).group("inventors.id")
    .select("count(*) as icount, inventors.name || ' ' || inventors.surname as full_name").order("icount DESC") }

end
