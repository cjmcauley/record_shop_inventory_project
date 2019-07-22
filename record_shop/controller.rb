require 'sinatra'
require 'sinatra/reloader'
require_relative './models/product'
require_relative './models/format'
require_relative './models/year'
require_relative './models/record_label'
require_relative './models/genre'
also_reload './models/*'

#INDEX
get '/products' do
  @genres = Genre.all()
  @products = Product.all()
  erb(:product)
end
#INDEX
get '/record-labels' do
  @record_labels = RecordLabel.all()
  erb(:record_label)
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
  redirect '/record-labels'
end
#DELETE
post '/products/:id/delete' do
  product = Product.find(params[:id])
  product.delete()
  redirect '/products'
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
#SHOW BY LABEL
 get '/record-labels/:id/show' do
   @products = Product.find_label(params[:id])
   erb(:show_label)
 end
