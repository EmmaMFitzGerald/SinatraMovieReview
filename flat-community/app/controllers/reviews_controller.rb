class ReviewsController < ApplicationController

  get '/reviews' do
    @reviews = Review.all
    erb :'reviews/reviews'
  end

  get '/reviews/new' do
    erb :'reviews/new'
  end

  post '/reviews' do
    @review = Review.create(
      :title => params[:title],
      :genre => params[:genre],
      :content => params[:content],
      :user_id => params[:user_id])
    redirect "/reviews/#{@review.id}"
  end

  get '/reviews/:id' do
    @review = Review.find_by_id(params[:id])
    erb :'/reviews/show'
  end

  get '/reviews/:id/edit' do
    @review = Review.find_by_id(params[:id])
    erb :'/reviews/edit'
  end

  patch '/reviews/:id' do
    @review = Review.find_by_id(params[:id])
    @review.title = params[:title]
    @review.genre = params[:genre]
    @review.content = params[:content]
    @review.save
    redirect to "/reviews/#{@review.id}"
  end

  delete '/reviews/:id/delete' do
    @review = Review.find_by_id(params[:id])
    @review.delete
    redirect to '/reviews'
  end

end
