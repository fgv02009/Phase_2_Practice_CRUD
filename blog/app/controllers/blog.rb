get '/blogs' do

end

get '/blogs/new' do
  if request.xhr?
    erb :"blog/new", layout: false
  else
    erb :"blog/new"
  end
end

post '/blogs' do
  #create new blog

  if request.xhr?
    p params
    puts "HELLO"
    @blog = Blog.new(title: params[:blog][:title], content:
     params[:blog][:content], user: current_user)
    if @blog.save
      @user = User.find(current_user)
      puts "right here"
      erb :"user/_profile", locals: {blog: @blog}, layout: false
    else
      redirect '/blogs/new'
    end
  else
     @blog = Blog.new(title: params[:blog][:title], content:
     params[:blog][:content], user: current_user)
    if @blog.save
      @user = User.find(current_user)
      redirect "users/#{current_user.id}/profile"
    else
      redirect '/blogs/new'
    end
  end
  # @blog = Blog.create(title: params[:blog][:title], content:
  #  params[:blog][:content], user: current_user)
  #  redirect "users/#{current_user.id}/profile"

end

delete '/blogs/:id' do
  @blog = Blog.find(params[:id])
  if current_user = @blog.user
    @blog.destroy
    redirect "users/#{current_user.id}/profile"
  else
    flash[:notice] = "You can't delete others blogs"
  end
end

get '/blogs/:id/edit' do
  @blog = Blog.find(params[:id])
  erb :'blog/edit'
end

put '/blogs/:id' do
  @blog = Blog.find(params[:id])
  @blog.update(title: params[:blog][:title], content: params[:blog][:content])
  redirect "users/#{current_user.id}/profile"
end
