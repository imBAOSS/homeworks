require_relative 'model_base'

class User < ModelBase

  attr_accessor :fname, :lname

  # def self.all(table)
  #   super(table)
  # end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return "no users with this name" if user.empty?
    User.new(user.first)
  end

  def initialize(options)
    @id = options["id"]
    @fname = options["fname"]
    @lname = options["lname"]
  end

  def authored_questions
    questions = Question.find_by_author_id(@id)
  end

  def authored_replies
    replies = Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
    ave = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      CAST(COUNT(question_likes.user_id) AS FLOAT) / COUNT(DISTINCT(questions.id)) AS average
    FROM
      questions
    LEFT OUTER JOIN
      question_likes ON questions.id = question_likes.question_id
    WHERE
      questions.user_id = ?
    SQL
    ave.first["average"]
  end

  # def save
  #   if @id
  #     #update
  #     QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
  #       UPDATE
  #         users
  #       SET
  #         fname = ?, lname = ?
  #       WHERE
  #         id = ?
  #     SQL
  #   else
  #     #insert
  #     QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
  #       INSERT INTO
  #         users (fname, lname)
  #       VALUES
  #         (?, ?)
  #     SQL
  #     @id = QuestionsDatabase.instance.last_insert_row_id
  #   end
  # end

end
