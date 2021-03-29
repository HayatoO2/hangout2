class Present < ApplicationRecord
  


  belongs_to :share
  belongs_to :user
  has_many :chats
  has_many :chats, through: :chat_presents
end
