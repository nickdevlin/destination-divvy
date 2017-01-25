get '/categories' do
  @categories = Category.all

  erb :index
end

get '/categories/:id' do
  @posts = Post.where(category_id: params[:id]).order(updated_at: :desc)

  erb :category
end
