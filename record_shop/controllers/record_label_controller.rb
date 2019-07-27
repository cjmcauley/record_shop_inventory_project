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
get '/record-labels' do
  @record_labels = RecordLabel.all()
  erb(:"labels/show_all")
end

#NEW
get '/record-labels/new' do
  erb(:"labels/new")
end

#CREATE
post '/record-labels' do
  @record_label = RecordLabel.new(params)
  @record_label.save()
  redirect '/products'
end

#DELETE
post '/record-labels/:id/delete' do
  record_label = RecordLabel.find(params[:id])
  record_label.delete()
  redirect '/record-labels'
end

#EDIT
get '/record-labels/:id/edit' do
  @record_label = RecordLabel.find(params[:id])
  erb(:"labels/edit")
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
  @record_label = RecordLabel.find(params[:id])
  erb(:"labels/show")
end
