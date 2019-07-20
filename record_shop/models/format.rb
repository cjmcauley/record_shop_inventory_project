require_relative '../db/sql_runner'
require_relative 'product'

class Format
  attr_reader :id
  attr_accessor :type

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

  def update()
    sql = "UPDATE formats
    SET
    type = $1
    WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete( id )
    sql = "DELETE FROM formats
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = 'DELETE FROM formats'
    SqlRunner.run(sql)
  end

end
