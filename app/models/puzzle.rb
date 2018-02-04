class Puzzle < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :level, presence: true, inclusion: { in: 1..6, message: "is not in range 1-6" }
  validates :producer, presence: {message: "need to be chosen"}
  has_many :makes, dependent: :destroy
  has_many :materials, through: :makes
  belongs_to :inventor, optional: true
  belongs_to :producer, foreign_key: 'company_id', class_name: 'Company', optional:true

  has_many :possesions, dependent: :destroy
  has_many :owners, through: :possesions, source: :user

  has_many :rates, dependent: :destroy
  has_many :users, through: :rates

  has_many :comments, as: :commentable
  has_many :commenters, through: :comments, source: :user

end
