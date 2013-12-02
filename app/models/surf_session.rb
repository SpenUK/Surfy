class SurfSession < ActiveRecord::Base

	belongs_to :user
	has_many :waves
	belongs_to :surf_spot

	def date
		self.created_at.strftime("%d/%m/%Y")
	end

	def random_generation

	end
	
end
