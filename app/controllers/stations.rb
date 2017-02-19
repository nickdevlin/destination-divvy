require 'net/http'
require 'json'

get '/stations' do
  uri = URI('https://feeds.divvybikes.com/stations/stations.json')
  @stations = JSON.parse(Net::HTTP.get(uri))["stationBeanList"]

  erb :index
end

post '/stations' do
  uri = URI('https://feeds.divvybikes.com/stations/stations.json')
  @stations = JSON.parse(Net::HTTP.get(uri))["stationBeanList"]
  @station = @stations.find {|station| station["stationName"] == params["origin"] }

  erb :station
end

post '/stations/:id' do
  uri = URI('https://feeds.divvybikes.com/stations/stations.json')
  @stations = JSON.parse(Net::HTTP.get(uri))["stationBeanList"]
  @destination = @stations.find {|station| station["stationName"] == params["destination"] }
  @station = @stations.find {|station| station["id"] == params[:id].to_i }

  erb :station
end
