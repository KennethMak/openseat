class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :max_occupy

      t.timestamps
    end
  end
end
