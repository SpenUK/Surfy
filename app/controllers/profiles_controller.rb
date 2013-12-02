class ProfilesController < ApplicationController

	def index
		@users = User.all
	end

	def show 
		@user = User.find(params[:id])
		@update_time = Time.new
	end

end
