class AddProAndTaglineToUser < ActiveRecord::Migration
  def change

  	add_column :users, :tagline, :string
  	add_column :users, :pro, :boolean

  end
end
