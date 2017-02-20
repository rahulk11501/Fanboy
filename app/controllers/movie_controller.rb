class MovieController < ApplicationController

  def index
    render json: MovieReview.all
  end

  def show
    render json: MovieReview.find(params[:id])
  end

  def create
    render json: MovieReview.create(title: params[:title], review: params[:review])
  end

  def update
    render json: MovieReview.update(params[:id], params[:movie])
  end

  def destroy
    render json: MovieReview.destroy(params[:id])
  end

  def top_movies
    url1 = 'http://www.omdbapi.com/?t=shawshank&y=&plot=short&r=json'
    url2 = 'http://www.omdbapi.com/?t=pulp+fiction&y=&plot=short&r=json'
    url3 = 'http://www.omdbapi.com/?t=secret+in+their+eyes&y=2009&plot=short&r=json'
    url4 = 'http://www.omdbapi.com/?t=+Taxi+Driver&y=&plot=short&r=json'
    url5 = 'http://www.omdbapi.com/?t=inception&y=&plot=short&r=json'
    url6 = 'http://www.omdbapi.com/?t=Room&y=&plot=short&r=json'
    url7 = 'http://www.omdbapi.com/?t=Inside+Out&y=&plot=short&r=json'
    url8 = 'http://www.omdbapi.com/?t=Hacksaw+Ridge&y=&plot=short&r=json'
    url9 = 'http://www.omdbapi.com/?t=arrival&y=2016&plot=short&r=json'
    url10 = 'http://www.omdbapi.com/?t=+Manchester+by+the+Sea+&y=&plot=short&r=json'
    url11 = 'http://www.omdbapi.com/?t=+Toy+Story+3+&y=&plot=short&r=json'
    url12 = 'http://www.omdbapi.com/?t=+3+Idiots&y=&plot=short&r=json'
     @shawshank = JSON.parse((Net::HTTP.get_response(URI.parse(url1))).body)
     @pulp_fiction = JSON.parse((Net::HTTP.get_response(URI.parse(url2))).body)
     @secret = JSON.parse((Net::HTTP.get_response(URI.parse(url3))).body)
     @taxi_driver = JSON.parse((Net::HTTP.get_response(URI.parse(url4))).body)
     @inception = JSON.parse((Net::HTTP.get_response(URI.parse(url5))).body)
     @room = JSON.parse((Net::HTTP.get_response(URI.parse(url6))).body)
     @inside_out = JSON.parse((Net::HTTP.get_response(URI.parse(url7))).body)
     @hacksaw = JSON.parse((Net::HTTP.get_response(URI.parse(url8))).body)
     @arrival = JSON.parse((Net::HTTP.get_response(URI.parse(url9))).body)
     @manchester = JSON.parse((Net::HTTP.get_response(URI.parse(url10))).body)
     @toystory = JSON.parse((Net::HTTP.get_response(URI.parse(url11))).body)
     @threeidiots  = JSON.parse((Net::HTTP.get_response(URI.parse(url12))).body)
     @top_movies = [@inception,@inside_out,  @room, @hacksaw, @threeidiots, @manchester, @toystory, @shawshank,@pulp_fiction,@arrival,@taxi_driver,@secret]

     render json: @top_movies
  end

  def search_movie
    name = params[:search_text]
    url = 'http://www.omdbapi.com/?s='+name
    @movies = JSON.parse((Net::HTTP.get_response(URI.parse(url))).body)
    render json: @movies
  end

  def reviews
    @movie_review = MovieReview.all
  end
end
