class Chat < ApplicationRecord
  validates :date, presence: true
  
  

  has_many :users
  has_many :users, through: :user_chats
  belongs_to :share
  has_many :presents
  has_many :presents, through: :chat_presents
end
