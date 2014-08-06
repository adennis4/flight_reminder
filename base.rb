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
    @record = FlightRecord.new params

    if @record.save
      redirect '/'
    else
      render '/'
    end
  end

  not_found do
    halt 404, 'guess again'
  end
end
