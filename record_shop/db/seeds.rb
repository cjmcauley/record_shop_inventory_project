require_relative ('../models/format')
require_relative ('../models/product')
require_relative ('../models/record_label')
require_relative ('../models/year')
require_relative ('../models/genre')

require('pry-byebug')

Product.delete_all
Format.delete_all
RecordLabel.delete_all
Year.delete_all
Genre.delete_all

domino = RecordLabel.new(
  'name' => 'Domino Recording Co'
)
domino.save

warp = RecordLabel.new(
  'name' => 'Warp Records'
)
warp.save

indie_rock = Genre.new(
  'name' => 'Indie Rock'
)
indie_rock.save

# (2000..2019).each do |i|
#   result = Year.new('year' => i.to_i).save
# end

year2019 = Year.new(
  'year' => 2019
)
year2019.save

year2018 = Year.new(
  'year' => 2018
)
year2018.save

year2017 = Year.new(
  'year' => 2017
)
year2017.save

year2016 = Year.new(
  'year' => 2016
)
year2016.save

year2015 = Year.new(
  'year' => 2015
)
year2015.save


vinyl = Format.new(
  'type' => 'Vinyl'
)
vinyl.save

compactdisc = Format.new(
  'type' => 'CD'
)
compactdisc.save

groove_denied = Product.new(
  'artist' => 'Stephen Malkmus',
  'title' => 'Groove Denied',
  'genre_id' => indie_rock.id,
  'quantity' => 5,
  'cost_price' => 6,
  'retail_price' => 11,
  'img_url' => 'https://www.dominomusic.com/res/N9Bz/720_720/StephenMalkmus_GrooveDenied_1400-300dpi-jpg.jpg',
  'record_label_id' => domino.id,
  'year_id' => year2019.id,
  'format_id' => vinyl.id
)
groove_denied.save

you_are_free = Product.new(
  'artist' => 'Cat Power',
  'title' => 'You Are Free',
  'genre_id' => indie_rock.id,
  'quantity' => 7,
  'cost_price' => 5,
  'retail_price' => 12,
  'img_url' => 'https://www.dominomusic.com/res/N9Bz/720_720/StephenMalkmus_GrooveDenied_1400-300dpi-jpg.jpg',
  'record_label_id' => domino.id,
  'year_id' => year2016.id,
  'format_id' => vinyl.id
)
you_are_free.save

binding.pry
nil
