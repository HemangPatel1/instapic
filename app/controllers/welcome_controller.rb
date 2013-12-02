class WelcomeController < ApplicationController
  
  def index
  	if current_user
    	redirect_to(pics_path, :notice => "Welcome back!")
	end
  end

end
