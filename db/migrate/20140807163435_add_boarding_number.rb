class AddBoardingNumber < ActiveRecord::Migration
  def up
    add_column :flight_records, :boarding_number, :string
  end

  def down
    remove_column :flight_records, :boarding_number
  end
end
