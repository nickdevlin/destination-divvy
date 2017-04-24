require 'net/http'
require 'json'
require_relative '../helpers/gps_helper'

get '/stations' do

  erb :index
end

post '/stations' do
  starting_point = GPSHelper.geocode(params["starting_point"])
  end_point = GPSHelper.geocode(params["end_point"])

  start_station = GPSHelper.find_nearest_station(starting_point)
  end_station = GPSHelper.find_nearest_station(end_point)

  @first_walk = GPSHelper.walking_directions(starting_point, [start_station["latitude"], start_station["longitude"]])
  @bike_ride = GPSHelper.biking_directions([start_station["latitude"], start_station["longitude"]], [end_station["latitude"], end_station["longitude"]])
  @second_walk = GPSHelper.walking_directions([end_station["latitude"], end_station["longitude"]], end_point)

  erb :index
end


