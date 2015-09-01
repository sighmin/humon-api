class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :address
      t.datetime :ended_at
      t.float :lat, null: false
      t.float :lon, null: false
      t.string :name, null: false
      t.datetime :started_at, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
    add_index :events, :user_id
  end
end
