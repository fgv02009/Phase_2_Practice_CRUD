get '/login' do

end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
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
  erb :"user/profile"
end
