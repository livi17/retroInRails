class ChangeDataTypeForLatitudeLongitude < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.change :event_lat, :float
      t.change :event_lon, :float
      t.change :your_lat,  :float
      t.change :your_lon,  :float
    end
  end
  def self.down
    change_table :events do |t|
      t.change :event_lat, :decimal
      t.change :event_lon, :decimal
      t.change :your_lat,  :decimal
      t.change :your_lon,  :decimal
    end
  end
end