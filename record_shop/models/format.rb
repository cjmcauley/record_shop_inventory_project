require_relative '../db/sql_runner'
require_relative 'product'

class Format
  attr_reader :id, :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save
    sql = '
    INSERT INTO formats
    (type)
    VALUES ($1)
    RETURNING ID'
    values = [@type]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM formats'
    SqlRunner.run(sql)
  end

end
