class Reply
  attr_accessor :body

  def self.all
    replies = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    replies.map { |reply| Reply.new(reply)}
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return "no replies from this user" if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return "no replies to this question" if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end



  def initialize(options)
    @id = options["id"]
    @body = options["body"]
    @question_id = options["question_id"]
    @user_id = options["user_id"]
    @reply_id = options["reply_id"]
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    return "This doesn't have a parent reply" unless @reply_id
    Reply.find_by_id(@reply_id)
  end

  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        reply_id = ?
    SQL
    return "No child replies" if replies.empty?

    replies.map { |reply| Reply.new(reply) }
  end

  def save

    if @id
      #update
      #grab
      QuestionsDatabase.instance.execute(<<-SQL, @body, @question_id, @user_id, @reply_id, @id)
        UPDATE
          replies
        SET
          body = ?, question_id = ?, user_id = ?, reply_id = ?
        WHERE
          id = ?
      SQL
    else
      #insert
      QuestionsDatabase.instance.execute(<<-SQL, @body, @question_id, @user_id, @reply_id)
        INSERT INTO
          replies (body, question_id, user_id, reply_id)
        VALUES
          (?, ?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end

end
