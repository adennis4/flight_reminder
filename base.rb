require './environments'

class FlightCheckin < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    haml :index
  end

  post '/' do
    @record = FlightRecordBuilder.build params

    if @record.save
      TravelAgent.new @record
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
