require 'sinatra'
require 'sinatra/reloader'
require_relative './models/product'
require_relative './models/format'
require_relative './models/year'
require_relative './models/record_label'
also_reload './models/*'

#INDEX
get '/products' do
  @products = Product.all()
  erb(:product)
end
#INDEX
get '/record_labels' do
  @record_labels = RecordLabel.all()
  erb(:record_label)
end
#SHOW
get '/products/:id' do
  @products = Product.find( params[:id] )
  erb( :show )
end
#CREATE
post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect '/products'
end
#NEW
get '/products/new' do
  @record_labels = RecordLabel.all()
  @years = Year.all()
  @formats = Format.all()
  erb(:new)
 end
#EDIT
 get '/products/:id/edit' do
   @record_labels = RecordLabel.all()
   @years = Year.all()
   @formats = Format.all()
   @product = Product.find(params[:id])
   erb(:edit)
 end
#UPDATE
 post '/products/:id' do
   product = Product.new(params)
   product.update()
   redirect '/products'
 end
