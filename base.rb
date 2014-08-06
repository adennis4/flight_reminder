require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'
require 'mechanize'
require 'pry'
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

class FlightRecord < ActiveRecord::Base
  validates_presence_of :confirmation, :first_name, :last_name, :email, :flight_date, :flight_time, :departure_time_zone
end

class TravelAgent

  def initialize(record)
    mechanize_setup
    @record = record
  end

  def mechanize_setup
    agent = Mechanize.new

    page = agent.get "http://www.southwest.com"
    review_page = page.form_with(id: 'retrieveItinerary') do |form|
      form.field_with(name: 'confirmationNumber').value = 'ABC123'
      form.field_with(name: 'firstName').value = 'Lionel'
      form.field_with(name: 'lastName').value = 'Messi'
    end.submit
  end
end
