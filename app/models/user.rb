class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_validation :set_nickname
  validates :nickname, presence: true, uniqueness: true

  has_many :possesions, dependent: :destroy
  has_many :possessed_puzzles, through: :possesions, source: :puzzle

  has_many :rates, dependent: :destroy
  has_many :puzzles, through: :rates

  private

  def set_nickname
    self.nickname = full_name || email if nickname.empty?
  end

  def full_name
    [name, surname].compact.join(' ') if name || surname
  end

end
