require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/genre_controller')
require_relative('controllers/product_controller')
require_relative('controllers/record_label_controller')

get '/' do
  erb( :index )
end
