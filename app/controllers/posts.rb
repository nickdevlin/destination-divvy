get "/categories/:id/posts/new" do
  @category = Category.find_by(id: params[:id])

  erb :"posts/new"
end

post "/posts" do
  @post = Post.create(params[:post])
  @key_for_poster = @post.key

  erb :"posts/show"
end

get "/posts/:id" do
  @post = Post.find_by(id: params[:id])
  erb :"posts/show"
end

get "/posts/:post_id/edit" do
  @post = Post.find_by(key: params[:key])
  @error_post = Post.find_by(id: params[:post_id])

  if @post
    erb :"posts/edit"
  else
    erb :"404"
  end
end

put "/posts/:post_id" do
  @post = Post.find_by(id: params[:post_id])
  @post.update_attributes(title: params[:title], body: params[:body], price: params[:price])
  @key_for_poster = @post.key

  erb :"posts/show"
end

