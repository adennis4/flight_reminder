require 'rubygems'
require 'bundler'
Bundler.require

Dir.glob('./{models}/*.rb').each { |file| require file }

require './base'
run FlightCheckin.new
