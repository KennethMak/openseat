class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :restaurant_id
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
