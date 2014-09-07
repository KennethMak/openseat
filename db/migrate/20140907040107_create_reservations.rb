class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :party_size
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
