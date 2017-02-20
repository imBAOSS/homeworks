# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Sub.create(title:'Dogs', description:'Talk about Dogs', user_id: 1)
Sub.create(title:'Cats', description:'Talk about Cats', user_id: 1)
Sub.create(title:'Birds', description:'Talk about Birds', user_id: 1)
Sub.create(title:'Monkies', description:'Talk about Monkies', user_id: 1)


Post.create(title:'Dogs and Cat are cool',user_id: 1, sub_id: [1,2])
Post.create(title:'Birds are great',user_id: 1, sub_id: [3])
Post.create(title:'Dogs and Cats and Monkies are nice',user_id: 1, sub_id: [1,2,4])
Post.create(title:'I like Monkies',user_id: 1, sub_id: [4])


PostSub.create(post_id: 1,sub_id: 1)
PostSub.create(post_id: 1,sub_id: 2)
PostSub.create(post_id: 2,sub_id: 3)
PostSub.create(post_id: 3,sub_id: 1)
PostSub.create(post_id: 3,sub_id: 2)
PostSub.create(post_id: 3,sub_id: 4)
PostSub.create(post_id: 4,sub_id: 4)
