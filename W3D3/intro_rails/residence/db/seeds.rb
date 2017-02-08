# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mansion = House.new(address: "123 mansion way")
house = House.new(address: "2895 house way")

mansion.save
house.save

bao = People.new(name: "Bao", house_id: 1)
parents = People.new(name: "Parent", house_id: 2)

bao.save
parents.save
