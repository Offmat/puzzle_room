class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, email: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_validation :set_nickname
  validates :nickname, presence: true, uniqueness: true

  has_many :possesions, dependent: :destroy
  has_many :possessed_puzzles, through: :possesions, source: :puzzle

  has_many :rates, dependent: :destroy
  has_many :puzzles, through: :rates

  has_many :comments
  has_many :commented_puzzles, through: :comments, source: :commentable,
           :source_type => 'Puzzle'

  has_many :commented_comments, through: :comments, source: :commentable,
           :source_type => 'Comment'

  private

  def set_nickname
    self.nickname = full_name || email if nickname.empty?
  end

  def full_name
    [name, surname].compact.join(' ') if name || surname
  end

end
