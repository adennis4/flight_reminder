require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'
require './environments'
require 'haml'

class FlightCheckin < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    haml :index
  end

  post '/' do
    @record = FlightRecord.new params

    if @record.save
      flash[:notice] = "#{@record.first_name}, you will be automatically checked-in for your flight."
      redirect '/'
    else
      flash[:error] = "You left something blank -- or I messed something up and you should text me."
      redirect '/'
    end
  end

  not_found do
    halt 404, 'guess again'
  end
end
