class PicsController < ApplicationController

before_filter :authenticate_user!
before_action :check_permission, only: [:destroy]

	def index
		@pics = Pic.all
	end

	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new((pic_params).merge(user: current_user))
		@pic.save
		redirect_to @pic
	end

	def show
		@pic = Pic.find(params[:id])
	end

	def destroy
		@pic = Pic.find(params[:id])
		@pic.destroy
		redirect_to pics_path
	end

private
	def check_permission
	   @pic = Pic.find(params[:id])

	  if @pic.user != current_user
	    flash.alert = "Not your post"
	    redirect_to pic_path(@pic)
	  end
	end

	def pic_params
		params.require(:pic).permit(:caption, :image)	
	end

end