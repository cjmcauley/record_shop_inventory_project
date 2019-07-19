require_relative '../db/sql_runner'
require_relative 'product'

class Year
  attr_reader :id, :year

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['year'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM years'
    SqlRunner.run(sql)
  end

end
