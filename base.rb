require './environments'

class FlightCheckin < Sinatra::Base
  enable :sessions
  use Rack::Flash

  use Rack::Auth::Basic, "Restricted Area" do |user, pass|
    user == 'andrew' and pass == 'rulez'
  end

  get '/' do
    haml :index
  end

  post '/' do
    @record = FlightRecordBuilder.build params

    if @record.save
      CheckinJob.schedule @record
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
