class Share < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :log_name, uniqueness: true
    validates :password, confirmation: true
    validates :password_confirmation
  end

  attr_encrypted :password, key: 'This is a key that is 256 bits!!'
  attr_encrypted :password_confirmation, key: 'This is a key that is 256 bits!!'

  has_many :share_users
  has_many :users, through: :share_users

  
end
