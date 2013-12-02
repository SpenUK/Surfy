class CreateWaves < ActiveRecord::Migration
  def change
    create_table :waves do |t|

    	t.integer :user_id
    	t.integer :surf_session_id
      t.string :location

      t.timestamps
    end
  end
end
