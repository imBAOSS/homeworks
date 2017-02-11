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
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    query = DBConnection.execute(<<-SQL, id)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = ?
    SQL

    query.empty? ? nil : parse_all(query).first
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
    values = self.class.columns.map do |key|
      self.send("#{key}")
    end
  end

  def insert
    col_names = self.class.columns
    question_marks = col_names[1..-1].map { |val| "?" }.join(", ")
    attrs = attribute_values[1..-1]

    DBConnection.execute(<<-SQL, *attrs
      INSERT INTO
        #{self.class.table_name} (#{col_names[1..-1].join(", ")})
      VALUES
        (#{question_marks})
    SQL
    )
    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_values = self.class.columns[1..-1].map do |attribute|
      "#{attribute} = ?"
    end.join(", ")
    attrs = attribute_values[1..-1]

    DBConnection.execute(<<-SQL, *attrs, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_values}
      WHERE
        id = ?
    SQL
  end

  def save
    self.id.nil? ? insert : update
  end
end
