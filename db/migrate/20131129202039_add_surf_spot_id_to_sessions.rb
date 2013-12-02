class AddSurfSpotIdToSessions < ActiveRecord::Migration
  def change

  	add_column :surf_sessions, :surf_spot_id, :string

  end
end
