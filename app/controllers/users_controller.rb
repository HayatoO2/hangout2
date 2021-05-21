class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :show]

  def edit
    @user = User.find(params[:id])
    redirect_to root_path if current_user.id != @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @shares = current_user
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password).merge(id: current_user.id)
  end
  
end


