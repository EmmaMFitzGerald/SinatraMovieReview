
class UsersController < ApplicationController

  #CREATE USER
  get '/signup' do
    if logged_in?
      redirect '/reviews'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do

    if params[:first_name] == "" || params[:last_name] == "" || params[:email] == "" || params[:password] == ""
      flash.now[:notice] = "You must fill in all spaces"
      redirect '/signup'
    else
      @user = User.create(
          :first_name => params[:first_name],
          :last_name => params[:last_name],
          :email => params[:email],
          :password => params[:password])
      redirect '/signup' if !@user.id
      session[:user_id] = @user.id
      redirect '/reviews'
    end
  end

    get '/profile' do
      erb :'/users/profile'
    end
  end




