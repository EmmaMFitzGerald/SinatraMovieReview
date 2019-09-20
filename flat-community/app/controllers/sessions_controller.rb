class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      redirect '/reviews'
      flash[:message] = "You are already logged in!"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       flash[:message] = "You are logged in!"
       redirect '/reviews'
     else
       erb :login_failure
     end
  end

  get '/logout' do
    if logged_in?
      session.clear
      flash[:message] = "You have been logged out!"
      redirect '/'
    else
      redirect '/'
    end
  end

end

