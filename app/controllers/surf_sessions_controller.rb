class SurfSessionsController < ApplicationController

	def show
		respond_to do |format|
			@surf_session = SurfSession.find(params[:id])
			format.js {}
		end
	end

	def new
		@surf_session = SurfSession.new
	end

	def create


		@surf_session = SurfSession.new(surf_sessions_params)
		@surf_session.surf_spot_id = @surf_session.surf_spot_id || SurfSpot.first(:offset => rand(SurfSpot.count)).id
		@surf_session.user_id = current_user.id 
		@surf_session.location = @surf_session.location || 'Polzeath'

		respond_to do |format|
			if @surf_session.save
				format.html { redirect_to root_path, notice: params}
				format.js {}
			else
				format.html { render :new, alert: 'failed to save'}
				format.js {}
			end
		end

	end

	def edit
		@surf_session = SurfSession.find(params[:id])

	end

	def update
		@surf_session = SurfSession.find(params[:id])

	end

	def destroy
		@surf_session = SurfSession.find(params[:id])
		@outfit.delete
	end

	def update_sessions_in_display

		@time_stamp = (params[:surf_session][:time_stamp]).to_i;
		@user = params[:surf_session][:profile_user];
		@time_now = Time.new.to_i;
		@sessions = SurfSession.where(user_id: @user).where("created_at > ?", Time.at(@time_stamp) );
		
		
		respond_to do |format|
			format.json { render json: {sessions: @sessions, timeNow: @time_now }};
		end


	end


	private
	def surf_sessions_params
		params.require(:surf_session).permit(:location)
	end

end
