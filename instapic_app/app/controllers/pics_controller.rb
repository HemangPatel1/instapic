class PicsController < ApplicationController

before_filter :authenticate_user!

	def index
		@pics = Pic.all
	end

	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new(pic_params)
		@pic.save
		redirect_to @pic
	end

	def show
		@pic = Pic.find(params[:id])
	end

private
	def pic_params
		params.require(:pic).permit(:caption)	
	end

end