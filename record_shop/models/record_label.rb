require_relative '../db/sql_runner'
require_relative 'product'

class RecordLabel
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = '
    INSERT INTO record_labels
    (name)
    VALUES ($1)
    RETURNING ID'
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE record_labels
    SET
    name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM record_labels
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM record_labels"
    record_labels = SqlRunner.run( sql )
    result = record_labels.map { |record_label| RecordLabel.new( record_label ) }
    return result
  end

  def self.find( id )
    sql = 'SELECT * FROM record_labels
    WHERE id = $1'
    values = [id]
    record_label = SqlRunner.run( sql, values )
    result = RecordLabel.new( record_label.first )
    return result
  end

  def self.delete_all
    sql = 'DELETE FROM record_labels'
    SqlRunner.run(sql)
  end

end
