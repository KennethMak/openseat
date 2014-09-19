class AddDefaultToRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :max_occupy
  	add_column :restaurants, :max_occupy, :integer, :null => false, :default => 0
  end
end
