class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :share_users
  has_many :shares, through: :share_users
  has_many :chats
  has_many :chats, through: :user_chats
  has_many :presents
end
