class CreateSurfSpots < ActiveRecord::Migration
  def change
    create_table :surf_spots do |t|
      t.string :location
      t.string :image_url
      t.string :country

      t.timestamps
    end
  end
end
