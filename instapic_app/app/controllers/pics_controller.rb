class PicsController < ApplicationController

before_filter :authenticate_user!, only: [:create, :destroy]
before_action :check_permission, only: [:destroy]

	def index
		@pics = Pic.all.order("pics.created_at desc")
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

	def mypics
		@pic = Pic.where(user_id: current_user).order("pics.created_at desc")
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