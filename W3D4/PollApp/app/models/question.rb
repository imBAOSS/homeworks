# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :text, presence: true

  belongs_to :poll,
    class_name: :Poll,
    primary_key: :id,
    foreign_key: :poll_id

  has_many :answer_choices,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :question_id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    query = <<-SQL
      SELECT
        answer_choices.*, COUNT(responses.*)
      FROM
        questions
      GROUP BY
        answer_choices
        HAVING
          COUNT(responses.*) > 0
    SQL

    return query
    # results_1 = {}
    # answers = answer_choices
    # answers.each { |answer| results_1[answer] = answer.responses.count }

    # results_2 = {}
    # answers = answer_choices.includes(:responses)
    # answers.each { |answer| results_2[answer] = answer.responses.length}

  end
end
