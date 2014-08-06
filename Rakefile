require 'rubygems'
require 'bundler'
Bundler.require

Dir.glob('./{models}/*.rb').each { |file| require file }

require './base.rb'
require 'sinatra/activerecord/rake'
require 'resque/scheduler/tasks'
