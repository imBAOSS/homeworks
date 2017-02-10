require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    @columns.first.map!(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{col}=") do |val|
        attributes[col] = val
      end

      define_method(col) do
        attributes[col]
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    query = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    self.parse_all(query)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    
  end

  def initialize(params = {})
    params.each_pair do |attr_name, value|
      if self.class.columns.include?(attr_name.to_sym)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
