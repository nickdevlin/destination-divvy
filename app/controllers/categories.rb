require 'net/http'
require 'json'

get '/categories' do
  @categories = Category.all
  uri = URI('https://feeds.divvybikes.com/stations/stations.json')
  @stations = JSON.parse(Net::HTTP.get(uri))["stationBeanList"]

  erb :index
end

get '/categories/:id' do
  @posts = Post.where(category_id: params[:id]).order(updated_at: :desc)

  erb :category
end
