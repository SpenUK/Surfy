class CreateSurfSessions < ActiveRecord::Migration
  def change
    create_table :surf_sessions do |t|
      t.integer :user_id
      t.string :location

      t.timestamps
    end
  end
end
