class PresentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def new
    
    if params[:present] == nil 
      @present = Present.new(enter_time: Date.today,  share_id: params[:share_id])
      @presents = Present.where('enter_time <= ? and leave_time > ?',Date.today,Date.today)
    else
      @present = Present.new(enter_time: params[:present][:enter_time],  share_id: params[:share_id], user_id: current_user.id)
      @presents = Present.where('enter_time <= ? and leave_time >= ?', @present.enter_time,@present.enter_time)
      
    end
      @out_user = Present.in_out(@presents,@present)


  end


  def create
    @present = Present.new(present_params)
    @present.owner_flag = params[:owner_flag] if params[:owner_flag].present?
    if @present.save
      binding.pry
      redirect_to  new_share_present_path(@present.share_id, present: {enter_time: @present.enter_time})

    else
      @presents = Present.where('enter_time <= ? and leave_time >= ?', @present.enter_time,@present.enter_time)
      @out_user = Present.in_out(@presents,@present)
      render :new
    end
  end

  def update
    @present = Present.find(params[:id])
    if @present.update(present_params)
      redirect_to  new_share_present_path(@present.share_id, present: {enter_time: @present.enter_time})
    else
      render :new
    end
  end

  def destroy
    present = Present.find(params[:id])
    present.destroy

    redirect_to new_share_present_path(params[:share_id], present: {enter_time: params[:page]})


  end

  private

  def present_params
    params.require(:present).permit(:enter_time, :leave_time, :page, :comment, :owner_flag).merge(user_id: current_user.id, share_id: params[:share_id])
  end

end





