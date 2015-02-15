get '/' do
  erb :"index"
end

get '/login' do
  if current_user
    redirect 'users/#{current_user.id}/profile'
  else
    erb :"login"
  end
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect "users/#{session[:user_id]}/profile"
  else
    flash[:notice] = "email password not found"
    redirect '/login'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  @blogs = @user.blogs
  erb :"user/profile"
end
