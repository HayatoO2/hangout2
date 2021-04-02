class Present < ApplicationRecord
  
  validates :enter_time, presence:true
  validates :leave_time, presence:true

  validate :enter_leave
  validate :owner_time
  validate :present_owner

  def enter_leave
    if enter_time.to_i  > leave_time.to_i
      errors.add(:退出時間, "は入室開始時間よりも後")
    end
  end

  def present_owner
    owners = Present.where(share_id: share_id, owner_flag: true)
    owner_times = []
    owners.each do |owner|
      owner_times << (owner.enter_time.to_i..owner.leave_time.to_i) 
    end
    owner_times.each do |owner_time|
      if owner_time.cover?(enter_time.to_i) || owner_time.cover?(leave_time.to_i)
        errors.add(:この時間は, "一人使用されています")
        break
      end
    end
  end

  def owner_time
    users = Present.where(share_id: share_id)
    owner_times = []
    users.each do |owner|
      break if !owner_flag
      owner_times << (owner.enter_time.to_i..owner.leave_time.to_i) 
    end
    owner_times.each do |owner_time|
      if owner_time.cover?(enter_time.to_i) || owner_time.cover?(leave_time.to_i)
        errors.add(:この時間は, "使用している人がいます")
        break
      end
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

  def self.owner_fin
    Present.where(owner_flag: true).each do |present|
      if present.leave_time.to_i <= Time.now.to_i + (9*60*60)
        present.owner_flag = nil
      end
    end
  end


end
