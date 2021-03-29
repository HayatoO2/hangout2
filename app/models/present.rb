class Present < ApplicationRecord
  validates :enter_time, presence: true
  validates :leave_time, presence: true


  belongs_to :share
  belongs_to :user
  has_many :chats
  has_many :chats, through: :chat_presents
end
