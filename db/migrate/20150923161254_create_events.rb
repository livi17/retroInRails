class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :event_location
      t.decimal :event_lat, :precision=>10, :scale=>6
      t.decimal :event_lon, :precision=>10, :scale=>6
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :location_based
      t.boolean :present
      t.boolean :single_day
      t.string :your_location
      t.decimal :your_lat, :precision=>10, :scale=>6
      t.decimal :your_lon, :precision=>10, :scale=>6
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :events, [:user_id, :created_at]
  end
end
