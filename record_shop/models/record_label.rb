require_relative '../db/sql_runner'
require_relative 'product'

class RecordLabel
  attr_reader :id, :name

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

  def self.delete_all
    sql = 'DELETE FROM record_labels'
    SqlRunner.run(sql)
  end

end
