require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative '../models/product'
require_relative '../models/format'
require_relative '../models/year'
require_relative '../models/record_label'
require_relative '../models/genre'
also_reload '../models/*'

#INDEX
get '/genres' do
  @genres = Genre.all()
  erb(:"genres/show_all")
end

#NEW
get '/genres/new' do
  erb(:"genres/new")
end

#CREATE
post '/genres' do
  @genre = Genre.new(params)
  @genre.save()
  redirect '/products'
end

#DELETE
post '/genres/:id/delete' do
  genre = Genre.find(params[:id])
  genre.delete()
  redirect '/genres'
end

#EDIT
get '/genres/:id/edit' do
  @genre = Genre.find(params[:id])
  erb(:"genres/edit")
end

#UPDATE
post '/genres/:id' do
  genre = Genre.new(params)
  genre.update()
  redirect '/genres'
end

#SHOW BY GENRE
get '/genres/:id/show' do
  @products = Product.find_genre(params[:id])
  @genre = Genre.find(params[:id])
  erb(:"genres/show")
end
