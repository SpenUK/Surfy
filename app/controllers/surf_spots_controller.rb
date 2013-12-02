class SurfSpotsController < ApplicationController

	def index
		@spots = SurfSpot.all
	end

	def show
		@spot = SurfSpot.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
		@spot = SurfSpot.find(params[:id])
	end

	def update
		@spot = SurfSpot.find(params[:id])
	end

	def delete
	end

	private
	def surf_spot_params

	end

end
