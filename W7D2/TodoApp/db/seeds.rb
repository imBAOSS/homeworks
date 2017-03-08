# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Todo.destroy_all
Todo.create(title: "todo1", body: "this is todo1", done: false);
Todo.create(title: "todo2", body: "this is todo2", done: false);
Todo.create(title: "todo3", body: "this is todo3", done: false);

Tag.create(name: "important")

Tagging.create(tag_id: 1, todo_id: 1)
Tagging.create(tag_id: 1, todo_id: 2)
