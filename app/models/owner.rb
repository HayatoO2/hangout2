class Owner < ApplicationRecord

  with_options presence: true do
    validates :start
    validates :finish
    validates :comment
    validates :owner_flag
  end

  validate :start_finish


  def start_finish
    if start.to_i  > finish.to_i
      errors.add(:退出時間, "は入室開始時間よりも後")
    end
  end


  belongs_to :share
  belongs_to :user

end
