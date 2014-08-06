class FlightRecord < ActiveRecord::Base
  validates_presence_of :confirmation, :first_name, :last_name, :email, :depart_at
end

