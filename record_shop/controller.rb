require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require_relative './models/product'
require_relative './models/format'
require_relative './models/year'
require_relative './models/record_label'
require_relative './models/genre'
also_reload './models/*'

get '/' do
  erb( :index )
end
