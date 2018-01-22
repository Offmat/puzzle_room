class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :comments, as: :commentable
  has_many :commenters, through: :comments, source: :user
end
