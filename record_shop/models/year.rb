require_relative '../db/sql_runner'
require_relative 'product'

class Year
  attr_reader :id, :year

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @year = options['year'].to_i
  end

  def save
    sql = '
    INSERT INTO years
    (year)
    VALUES ($1)
    RETURNING ID'
    values = [@year]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM years"
    years = SqlRunner.run( sql )
    result = years.map { |year| Year.new( year ) }
    return result
  end

  def self.delete_all
    sql = 'DELETE FROM years'
    SqlRunner.run(sql)
  end

end
