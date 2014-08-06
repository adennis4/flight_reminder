class CombineTimeDateFields < ActiveRecord::Migration
  def up
    add_column :flight_records, :depart_at, :datetime
    remove_column :flight_records, :flight_date
    remove_column :flight_records, :flight_time
    remove_column :flight_records, :departure_time_zone
  end

  def down
    remove_column :flight_records, :depart_at
    add_column :flight_records, :flight_date, :date
    add_column :flight_records, :flight_time, :time
    add_column :flight_records, :departure_time_zone, :string
  end
end
