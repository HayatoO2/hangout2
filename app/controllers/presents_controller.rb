class PresentsController < ApplicationController

  def new
    @present = Present.new(share_id: params[:share_id])
  end

  def create
    @present = Present.new(present_params)
    
    if @present.save
      redirect_to new_share_present(@present.share_id)
    else
      render :new
    end
  end

  private

  def present_params
    params.require(:present).permit(:enter_time, :leave_time).merge(user_id: current_user.id, share_id: params[:share_id])
  end

end
