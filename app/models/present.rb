class Present < ApplicationRecord
  
  validates :enter_time, presence:true
  validates :leave_time, presence:true

  validate :enter_leave


  def enter_leave
    if enter_time.to_i  > leave_time.to_i
      errors.add(:退出時間, "は入室開始時間よりも後")
    end
  end


  belongs_to :share
  belongs_to :user


  def self.in_out(presents,present)
    in_user = []
    presents.each do |present|
      in_user << present.user_id
    end
    out_user = present.share.users.ids
    in_user.each do |user|
    out_user.delete(user)
    end
  return out_user
  end
end
