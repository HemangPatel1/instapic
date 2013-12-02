class ChatController < ApplicationController
  
  def index
  	if params[:chat]
  		flash[:notice] = "Chat started..."
  	end
  	WebsocketRails[:chat].trigger 'new'
  end

end
