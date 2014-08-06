class AddStatusToFlightRecord < ActiveRecord::Migration
  def change
    add_column :flight_records, :status, :string, default: 'incomplete'
  end
end
