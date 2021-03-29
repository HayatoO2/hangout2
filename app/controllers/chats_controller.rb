class ChatsController < ApplicationController


  def new
    
    chat = Chat.find_by(share_id: params[:share_id], date: Date.today)
    if Chat.all.include?(chat)
      chat.save
      # redirect_to edit_share_chat_path(@chat.share_id, @chat.id)
    else

      # redirect_to edit_share_chat_path(chat.share_id, chat.id)
    end
  end

  
end
