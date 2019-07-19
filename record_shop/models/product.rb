require_relative '../db/sql_runner'
require_relative 'format'
require_relative 'year'
require_relative 'record_label'

class Product
  attr_reader :id, :artist, :title, :quantity, :cost_price, :retail_price, :img_url, :record_label_id, :year_id, :format_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist = options['artist']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @cost_price = options['cost_price'].to_f
    @retail_price = options['retail_price'].to_f
    @img_url = options['img_url']
    @record_label_id = options['record_label_id'].to_i
    @year_id = options['year_id'].to_i
    @format_id = options['format_id'].to_i
  end

  def save
    sql = '
    INSERT INTO products
    (artist, title, quantity, cost_price, retail_price, img_url, record_label_id, year_id, format_id)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING ID'
    values = [@artist, @title, @quantity, @cost_price, @retail_price, @img_url, @record_label_id, @year_id, @format_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM products'
    SqlRunner.run(sql)
  end

end
