class SurfSpot < ActiveRecord::Base

	has_many :surf_sessions
	has_many :users, through: :surf_sessions
	
end
