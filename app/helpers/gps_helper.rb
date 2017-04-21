module GPSHelper
  def self.geocode(address)
    raw_address = address.gsub! /\s+/, '+'
    uri = URI('https://maps.googleapis.com/maps/api/geocode/json?address=' + raw_address + '&key=AIzaSyAOmgyNN8aHGAGn22H3I1v3baXHlBhrqY8')
    lat = JSON.parse(Net::HTTP.get(uri))["results"][0]["geometry"]["location"]["lat"]
    long = JSON.parse(Net::HTTP.get(uri))["results"][0]["geometry"]["location"]["lng"]
    return [lat, long]
  end

  def self.compare_two_points(point1, point2)
  end

  def self.find_nearest_station(coordinate_array)
    uri = URI('https://feeds.divvybikes.com/stations/stations.json')
    @stations = JSON.parse(Net::HTTP.get(uri))["stationBeanList"]

  end
end
