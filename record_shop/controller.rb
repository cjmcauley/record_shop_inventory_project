require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './models/product'
require_relative './models/format'
require_relative './models/year'
require_relative './models/record_label'
require_relative './models/genre'
also_reload './models/*'

#INDEX
get '/products' do
  @products = Product.all()
  erb(:product)
end
#INDEX
get '/record-labels' do
  @record_labels = RecordLabel.all()
  erb(:record_label)
end
#INDEX
get '/genres' do
  @genres = Genre.all()
  erb(:genre)
end
#NEW
get '/products/new' do
  @record_labels = RecordLabel.all()
  @years = Year.all()
  @formats = Format.all()
  @genres = Genre.all()
  erb(:new)
end
#NEW
get '/record-labels/new' do
  erb(:new_label)
end
#NEW
get '/genres/new' do
  erb(:new_genre)
end
#SHOW
get '/products/:id' do
  @product = Product.find(params[:id])
  erb(:show)
end
#CREATE
post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect '/products'
end
#CREATE
post '/record-labels' do
  @record_label = RecordLabel.new(params)
  @record_label.save()
  redirect '/products'
end
#CREATE
post '/genres' do
  @genre = Genre.new(params)
  @genre.save()
  redirect '/products'
end
#DELETE
post '/products/:id/delete' do
  product = Product.find(params[:id])
  product.delete()
  redirect '/products'
end
#DELETE
post '/genres/:id/delete' do
  genre = Genre.find(params[:id])
  genre.delete()
  redirect '/genres'
end
#DELETE
post '/record-labels/:id/delete' do
  record_label = RecordLabel.find(params[:id])
  record_label.delete()
  redirect '/record-labels'
end
#EDIT
 get '/products/:id/edit' do
   @record_labels = RecordLabel.all()
   @years = Year.all()
   @formats = Format.all()
   @genres = Genre.all()
   @product = Product.find(params[:id])
   erb(:edit)
 end
#EDIT
 get '/record-labels/:id/edit' do
   @record_label = RecordLabel.find(params[:id])
   erb(:edit_label)
 end
#EDIT
 get '/genres/:id/edit' do
   @genre = Genre.find(params[:id])
   erb(:edit_genre)
 end
#UPDATE
 post '/products/:id' do
   product = Product.new(params)
   product.update()
   redirect '/products'
 end
#UPDATE
 post '/record-labels/:id' do
   record_label = RecordLabel.new(params)
   record_label.update()
   redirect '/record-labels'
 end
#UPDATE
 post '/genres/:id' do
   genre = Genre.new(params)
   genre.update()
   redirect '/genres'
 end
#SHOW BY LABEL
 get '/record-labels/:id/show' do
   @products = Product.find_label(params[:id])
   @record_label = RecordLabel.find(params[:id])
   erb(:show_label)
 end
#SHOW BY GENRE
 get '/genres/:id/show' do
   @products = Product.find_genre(params[:id])
   @genre = Genre.find(params[:id])
   erb(:show_genre)
 end
