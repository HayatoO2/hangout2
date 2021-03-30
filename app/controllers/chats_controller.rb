class ChatsController < ApplicationController


  def new
    binding.pry
    @chat = Chat.new(share_id: params[:share_id], date: params[:date])
    @chat_form_present = ChatFormPresent.new
    
    chat = Chat.find_by(share_id: params[:share_id], date: Date.today)
    
    if Chat.all.include?(chat)
      chat.save
    end
  end

  def create
    @chat_form_present = ChatFormPresent.new(chat_form_present_params)
    date_enter(@chat_form_present)

    if @chat_form_present.valid?
      @chat_form_present.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def chat_form_present_params
    params.require(:chat_form_present).permit(:enter_time, :leave_time, :city, :house_number, :building_name, :price).merge(user_id: current_user.id, share_id: params[:share_id])
  end

  def date_enter(object)
    object.date = object.enter_time.to_date
  end


end
