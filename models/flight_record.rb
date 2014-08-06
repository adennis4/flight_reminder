class FlightRecord < ActiveRecord::Base
  validates_presence_of :confirmation, :first_name, :last_name, :email, :flight_date, :flight_time, :departure_time_zone
end

