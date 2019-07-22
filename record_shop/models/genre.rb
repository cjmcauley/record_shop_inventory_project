require_relative '../db/sql_runner'
require_relative 'product'

class Genre
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = '
    INSERT INTO genres
    (name)
    VALUES ($1)
    RETURNING ID'
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE genres
    SET
    name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM genres
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM genres"
    genres = SqlRunner.run( sql )
    result = genres.map { |genre| Genre.new( genre ) }
    return result
  end

  def self.find( id )
    sql = 'SELECT * FROM genres
    WHERE id = $1'
    values = [id]
    genres = SqlRunner.run( sql, values )
    result = Genre.new( genres.first )
    return result
  end

  def self.delete_all
    sql = 'DELETE FROM genres'
    SqlRunner.run(sql)
  end

end
