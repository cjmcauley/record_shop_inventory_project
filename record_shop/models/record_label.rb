require_relative '../db/sql_runner'
require_relative 'product'

class RecordLabel
  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def self.delete_all
    sql = 'DELETE FROM record_labels'
    SqlRunner.run(sql)
  end

end
