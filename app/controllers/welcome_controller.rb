class WelcomeController < ApplicationController
  
  def index
  	if current_user
    	redirect_to(pics_path, :notice => "Welcome back!")
	else
    	redirect_to root_path
	end
  end

end
