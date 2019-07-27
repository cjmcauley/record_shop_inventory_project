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
get '/products' do
  @products = Product.all()
  erb(:"products/product")
end

#NEW
get '/products/new' do
  @record_labels = RecordLabel.all()
  @years = Year.all()
  @formats = Format.all()
  @genres = Genre.all()
  erb(:"products/new")
end

#SHOW
get '/products/:id' do
  @product = Product.find(params[:id])
  erb(:"products/show")
end

#CREATE
post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect '/products'
end

#DELETE
post '/products/:id/delete' do
  product = Product.find(params[:id])
  product.delete()
  redirect '/products'
end

#EDIT
get '/products/:id/edit' do
  @record_labels = RecordLabel.all()
  @years = Year.all()
  @formats = Format.all()
  @genres = Genre.all()
  @product = Product.find(params[:id])
  erb(:"products/edit")
end

#UPDATE
post '/products/:id' do
  product = Product.new(params)
  product.update()
  redirect '/products'
end
