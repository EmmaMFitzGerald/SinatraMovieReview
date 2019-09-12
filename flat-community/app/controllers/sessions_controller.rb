class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      redirect '/reviews'
      #need error message here
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect '/reviews'
     else
       redirect '/login'
     end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end

