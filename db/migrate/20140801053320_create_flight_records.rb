class CreateFlightRecords < ActiveRecord::Migration
  def up
    create_table :flight_records do |t|
      t.string :confirmation
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :flight_date
      t.time :flight_time
      t.string :departure_time_zone
      t.timestamps
    end
  end

  def down
    drop_table :flight_records
  end
end
