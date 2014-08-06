require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'haml'

class FlightRecord < ActiveRecord::Base

end

class FlightCheckin < Sinatra::Base

  get '/' do
    haml :index
  end

  post '/' do
    confirmation = params[:confirmation]
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    flight_date = params[:flight_date]
    flight_time = params[:flight_time]
    departure_time_zone = params[:departure_time_zone]
  end

  not_found do
    halt 404, 'guess again'
  end
end
