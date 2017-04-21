module GPSHelper
  def self.geocode(address)
    raw_address = address.gsub! /\s+/, '+'
    uri = URI('https://maps.googleapis.com/maps/api/geocode/json?address=' + raw_address + '&key=' + GOOGLE_API_KEY)
    lat = JSON.parse(Net::HTTP.get(uri))["results"][0]["geometry"]["location"]["lat"]
    long = JSON.parse(Net::HTTP.get(uri))["results"][0]["geometry"]["location"]["lng"]
    return [lat, long]
  end

  def self.compare_two_points(point1, point2)
    earth_radius_km = 6371

    d_lat = degrees_to_radians(point2[0] - point1[0])
    d_long = degrees_to_radians(point2[1] - point1[1])

    point1[0] = degrees_to_radians(point1[0])
    point2[0] = degrees_to_radians(point2[0])

    a = Math.sin(d_lat/2) * Math.sin(d_lat/2) + Math.sin(d_long/2) * Math.sin(d_long/2) * Math.cos(point1[0]) * Math.cos(point2[0])
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    return earth_radius_km * c
  end

  def self.find_nearest_station(coordinate_array)
    uri = URI('https://feeds.divvybikes.com/stations/stations.json')
    stations = JSON.parse(Net::HTTP.get(uri))["stationBeanList"]
    stations.each do |station|
    end
  end

  def self.degrees_to_radians(degrees)
    return degrees * (Math::PI / 180)
  end
end
