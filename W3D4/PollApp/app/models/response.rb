# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :respondent_already_answered?, :poll_owner?

  belongs_to :respondent,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :answer_id

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :created_poll,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if sibling_responses.exists?(respondent.id)
      self.errors[:already] = "responded"
      true
    else
      false
    end
  end

  def poll_owner?
    if self.created_poll.poll.author_id == respondent.id
      self.errors[:owner] = "can't respond to own poll"
      true
    else
      false
    end
  end
end
