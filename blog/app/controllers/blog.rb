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
  if request.xhr?
    @blog = Blog.find(params[:id])
    erb :'blog/edit', locals: {blog: @blog}, layout: false
  else
    @blog = Blog.find(params[:id])
    erb :'blog/edit'
  end
end

put '/blogs/:id' do
  @blog = Blog.find(params[:id])
  if request.xhr?
    @blog.update(title: params[:blog][:title], content: params[:blog][:content])
  else
    @blog.update(title: params[:blog][:title], content: params[:blog][:content])
    redirect "users/#{current_user.id}/profile"
  end
end
