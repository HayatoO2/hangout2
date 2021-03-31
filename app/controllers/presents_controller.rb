class PresentsController < ApplicationController

  def new



    
    if params[:present] == nil 
      @present = Present.new(enter_time: Date.today,  share_id: params[:share_id])
      @presents = Present.where('enter_time <= ? and leave_time > ?',Date.today,Date.today)
    else
      @present = Present.new(enter_time: params[:present][:enter_time],  share_id: params[:share_id])
      @presents = Present.where('enter_time <= ? and leave_time >= ?', @present.enter_time,@present.enter_time)
      
    end
      @out_user = Present.in_out(@presents,@present)
  end


  def create
    @present = Present.new(present_params)
    
    if @present.save

      redirect_to  new_share_present_path(@present.share_id, present: {enter_time: @present.enter_time})

    else
      render :new
    end
  end

  def update
    binding.pry
  end

  private

  def present_params
    params.require(:present).permit(:enter_time, :leave_time).merge(user_id: current_user.id, share_id: params[:share_id])
  end

end





