require_relative '../models/format'
require_relative '../models/product'
require_relative '../models/record_label'
require_relative '../models/year'

Product.delete_all
Format.delete_all
RecordLabel.delete_all
Year.delete_all

domino = RecordLabel.new(
  'name' => 'Domino Recording Co'
)
domino.save

year1 = Year.new(
  'year' => 2019
)
year1.save

vinyl = Format.new(
  'type' => 'Vinyl'
)
vinyl.save

groove_denied = Product.new(
  'artist' => 'Stephen Malkmus',
  'title' => 'Groove Denied',
  'quantity' => 5,
  'cost_price' => 6,
  'retail_price' => 11,
  'img_url' => 'https://www.dominomusic.com/res/N9Bz/720_720/StephenMalkmus_GrooveDenied_1400-300dpi-jpg.jpg',
  'record_label_id' => domino.id,
  'year_id' => year1.id,
  'format_id' => vinyl.id
)
groove_denied.save
