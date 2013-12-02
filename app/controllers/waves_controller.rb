class WavesController < ApplicationController

	def show
		@wave = Wave.find(:id)
	end

	def new
		@wave = Wave.new
	end

	def create
		@wave = Wave.new(wave_param)

		if @wave.save
			happy
		else
			sad
		end

	end

	def edit
		@wave = Wave.find(:id)
	end

	def update
		@wave = Wave.find(:id)

		if @wave.update_attributes(wave_params)
			happy
		else
			sad
		end

	end

	def destroy
		@wave = Wave.find(:id)
	end

	private
	def waves_params
		params.require(:wave).permit(:description)
	end


end
