require 'sinatra'
require 'sinatra/reloader'
require_relative './models/product'
require_relative './models/format'
require_relative './models/year'
require_relative './models/record_label'
also_reload './models/*'

get '/products' do
  @products = Product.all
  erb(:product)
end

get '/record_labels' do
  @record_labels = RecordLabel.all
  erb(:record_label)
end

post '/products' do
  @product = Product.new(params)
  @product.save
  redirect '/products'
end

get '/products/new' do
  @record_labels = RecordLabel.all
  @years = Year.all
  @formats = Format.all
  erb(:new_product)
 end
