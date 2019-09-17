class ReviewsController < ApplicationController

  get '/reviews/new' do
    if logged_in?
      erb :"reviews/new"
    else
      flash[:message] = "You need to log in to view this page"
      redirect '/login'
    end
  end

  post '/reviews' do
    if params[:title] == "" || params[:genre] == "" || params[:content] == ""
      flash[:message] = "Please fill in all areas"
      redirect '/reviews/new'
    else
      user = current_user
      @review = Review.create(
          :title => params[:title],
          :genre => params[:genre],
          :content => params[:content],
          :user => current_user)
      redirect "/reviews/#{@review.id}"
    end
  end

  get '/reviews' do
    if logged_in?
      @reviews = Review.all
      erb :"reviews/reviews"
     else
      erb :failure
    end
  end

  get '/profile' do
    if logged_in?
      @user = current_user
      @reviews = @user.reviews.all
      erb :'/reviews/profile'
    else
      erb :failure
    end
  end

  get '/reviews/:id' do
    if logged_in?
      @review = Review.find_by_id(params[:id])
      erb :'/reviews/show'
    else
      erb :failure
    end
  end

  get '/reviews/:id/edit' do
    if !logged_in?
      erb :failure
    else
      @review = Review.find(params[:id])
      if @review.user_id == current_user.id
      erb :'/reviews/edit'
      else
        flash.now[:message] = "You can only edit your reviews"
        redirect '/reviews'
      end
    end
  end

  patch '/reviews/:id' do
    if !logged_in?
      erb :failure
    else
      if params[:title] == "" || params[:genre] == "" || params[:content] == ""
                flash[:message] = "Oops! Reviews must have a title, genre and content. Please try again."
                redirect to "/reviews/#{params[:id]}/edit"
      elsif @review = Review.find_by_id(params[:id])
        @review.title = params[:title]
        @review.genre = params[:genre]
        @review.content = params[:content]
        @review.save
        redirect to "/reviews/#{@review.id}"
      else
        flash[:message] = "You can only edit your reviews"
        redirect '/reviews'
      end
    end
  end

  delete '/reviews/:id/delete' do
    if !logged_in?
      erb :failure
    else
      @review = Review.find_by_id(params[:id])
      if @review.user_id == session[:user_id]
        @review.destroy
        redirect to '/reviews'
      else
        flash.now[:message] = "You can only delete your reviews"
        redirect '/reviews'
      end
    end
  end

  end
