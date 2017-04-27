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

    dtr_first = degrees_to_radians(point1[0])
    dtr_second = degrees_to_radians(point2[0])

    a = Math.sin(d_lat/2) * Math.sin(d_lat/2) + Math.sin(d_long/2) * Math.sin(d_long/2) * Math.cos(dtr_first) * Math.cos(dtr_second)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    return earth_radius_km * c
  end

  def self.find_nearest_station(gps_coordinates)
    uri = URI('https://feeds.divvybikes.com/stations/stations.json')
    stations = JSON.parse(Net::HTTP.get(uri))["stationBeanList"]
    nearest_station = stations.min_by { |station| (compare_two_points(gps_coordinates, [ station["latitude"], station["longitude" ] ])) }
    return nearest_station
  end

  def self.degrees_to_radians(degrees)
    return degrees * (Math::PI / 180)
  end

  def self.walking_directions(start, finish)
    uri = URI('https://maps.googleapis.com/maps/api/directions/json?origin=' + start[0].to_s + ',' + start[1].to_s + '&destination=' + finish[0].to_s + ',' + finish[1].to_s + '&mode=walking&key=' + GOOGLE_API_KEY)
    directions = JSON.parse(Net::HTTP.get(uri))["routes"][0]["legs"][0]["steps"]
    p "************************"
    p directions
    p "*************************"
    return directions
  end

  def self.biking_directions(start, finish)
    uri = URI('https://maps.googleapis.com/maps/api/directions/json?origin=' + start[0].to_s + ',' + start[1].to_s + '&destination=' + finish[0].to_s + ',' + finish[1].to_s + '&mode=bicycling&key=' + GOOGLE_API_KEY)
    directions = JSON.parse(Net::HTTP.get(uri))["routes"][0]["legs"][0]["steps"]
    return directions
  end
end
