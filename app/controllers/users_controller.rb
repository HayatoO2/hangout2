class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])

    redirect_to root_path if current_user.id != @user.id
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to edit_user_path(current_user.id)
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end
  
end


