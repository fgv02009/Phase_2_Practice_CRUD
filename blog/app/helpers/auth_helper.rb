helpers do
  if session[:user_id]
    def current_user
      current_user ||= session[:user_id]
    end
  end
end
