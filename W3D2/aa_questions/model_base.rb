require_relative 'questions_database'
require 'byebug'

class ModelBase

  def self.all(table)
    data = QuestionsDatabase.instance.execute("SELECT * FROM #{table}")
    # debugger
    data.map { |datum| self.new(datum) }
  end

  def self.find_by_id(id, table)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL

    return nil unless data.length > 0

    self.new(data.first)
  end

  def save(table)
    p set_string = self.instance_variables[1..-1].map { |var| var.to_s[1..-1] + " = ?" }.join(", ")
    p params_string = self.instance_variables[1..-1].map { |var| var.to_s }.join(", ")
    p insert_into_string = self.instance_variables[1..-1].map { |var| var.to_s[1..-1] }.join(", ")
    p values_string = self.instance_variables[1..-1].map { |var| "?" }.join(", ")
    insert_into = "#{table} (#{insert_into_string})"

    if @id
      QuestionsDatabase.instance.execute(<<-SQL, #{params_string}, @id
        UPDATE
          #{table}
        SET
          #{set_string}
        WHERE
          id = ?
      SQL
      )
    else
      # debugger
      QuestionsDatabase.instance.execute(<<-SQL, #{params_string}
        INSERT INTO
          #{insert_into}
        VALUES
          (#{values_string})
      SQL
      )
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end

end
