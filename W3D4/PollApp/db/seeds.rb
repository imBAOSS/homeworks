# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dora = User.create!(user_name: "dora")
bao = User.create!(user_name: "imbaoss")

poll1 = Poll.create!(title: "Bootcamp", author_id: 1)
poll2 = Poll.create!(title: "Sleeping Patterns", author_id: 1)
poll3 = Poll.create!(title: "Favorite Cars?", author_id: 2)

question1 = Question.create!(text: "Which bootcamps did you apply to?", poll_id: 1)
question2 = Question.create!(text: "Which one's the hardest?", poll_id: 1)
question3 = Question.create!(text: "What time do you get up?", poll_id: 2)
question4 = Question.create!(text: "What time do you sleep?", poll_id: 2)
question5 = Question.create!(text: "What is your favorite car?", poll_id: 3)

answer1 = AnswerChoice.create!(text: "App Academy", question_id: 1)
answer2 = AnswerChoice.create!(text: "Hack Reactor", question_id: 1)
answer3 = AnswerChoice.create!(text: "General Assembly", question_id: 1)
answer4 = AnswerChoice.create!(text: "Coding Dojo", question_id: 1)

answer5 = AnswerChoice.create!(text: "App Academy", question_id: 2)
answer6 = AnswerChoice.create!(text: "Hack Reactor", question_id: 2)

answer7 = AnswerChoice.create!(text: "6:15 AM", question_id: 3)
answer8 = AnswerChoice.create!(text: "5:00 AM", question_id: 3)

answer9 = AnswerChoice.create!(text: "11:30 PM", question_id: 4)
answer10 = AnswerChoice.create!(text: "11:00 PM", question_id: 4)

answer11 = AnswerChoice.create!(text: "Toyota Prius", question_id: 5)
answer12 = AnswerChoice.create!(text: "BMW I8", question_id: 5)

# Responses to Question 1
response1 = Response.create!(user_id: 1, answer_id: 1)
response2 = Response.create!(user_id: 1, answer_id: 3)

response3 = Response.create!(user_id: 2, answer_id: 1)
response4 = Response.create!(user_id: 2, answer_id: 2)
response5 = Response.create!(user_id: 2, answer_id: 3)
response6 = Response.create!(user_id: 2, answer_id: 4)

# Responses to Question 2
response7 = Response.create!(user_id: 1, answer_id: 5)
response8 = Response.create!(user_id: 2, answer_id: 6)

# Responses to Question 3
response9 = Response.create!(user_id: 1, answer_id: 7)
response10 = Response.create!(user_id: 2, answer_id: 8)

# Responses to Question 4
response11 = Response.create!(user_id: 1, answer_id: 9)
response12 = Response.create!(user_id: 2, answer_id: 10)

# Responses to Quesiton 5
response13 = Response.create!(user_id: 1, answer_id: 11)
response14 = Response.create!(user_id: 2, answer_id: 12)
