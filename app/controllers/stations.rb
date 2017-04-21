require 'net/http'
require 'json'
require_relative '../helpers/gps_helper'

get '/stations' do

  erb :index
end

post '/stations' do
  @starting_point = GPSHelper.geocode(params["starting_point"])
  @end_point = GPSHelper.geocode(params["end_point"])

  erb :index
end


