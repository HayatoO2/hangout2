class SharesController < ApplicationController
  # before_action :authenticate_user!, only: [:add, :new, :show]


  def new
    @share = Share.new
  end

  def create
    @share = current_user.shares.new(share_params)
    if current_user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def add
    

  end

  def add_update
    
      share = Share.where(log_name: params[:log_name]).first



      if share.password == params[:password] && ShareUser.where(user_id: current_user.id, share_id: share.id).first.blank?
        share_user = ShareUser.create(user_id: current_user.id, share_id: share.id)
        redirect_to root_path
      
      else  
        render :add
      end
  end

  def show
    @share = Share.find(params[:id])
    redirect_to root_path unless @share.users.include?(current_user)
  end

  private

  def share_params
    params.require(:share).permit(:name, :log_name, :password, :password_confirmation)
  end

end
