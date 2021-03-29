class ChatFormPresent
  include ActiveModel::Model

  attr_accessor :date, :share_id, :user_id, :enter_time, :leave_time, :user_id


with_options presence: true do
  validates :date
  validates :enter_time
  validates :leave_time
end

def save
  chat = Chat.create(date: date, share_id: share_id)
  binding.pry
  present = Present.create(user_id: user_id, enter_time: enter_time, leave_time: leave_time, share_id: share_id)
  ChatPresent.create(chat_id: chat.id, present_id: present.id)

end



end