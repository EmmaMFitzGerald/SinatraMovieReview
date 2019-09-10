
class UsersController < ApplicationController

  post '/login' do
    "You are logged in as #{session[:email]}"
  end
end
