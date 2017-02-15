# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(name: "Sparky", birth_date: "2007/02/14", sex: 'M', color: "white",
  description: "Fastest cat EVER!")
Cat.create!(name: "Garfield", birth_date: "1999/07/07", sex: 'M', color: "orange",
  description: "Loves lasagna. Hates Mondays.")
Cat.create!(name: "Felicia", birth_date: "2015/01/16", sex: 'F', color: "brown",
  description: "she likes to chill. sunbathe. ya know.")

sparky = Cat.find(1)
gar = Cat.find(2)
fel = Cat.find(3)

r1 = CatRentalRequest.new(cat_id: 1, start_date: "2017/02/07", end_date: "2017/02/14", status: "APPROVED")
r2 = CatRentalRequest.new(cat_id: 1, start_date: "2017/02/15", end_date: "2017/02/19", status: "APPROVED")
r3 = CatRentalRequest.new(cat_id: 1, start_date: "2017/02/10", end_date: "2017/02/16")

r1.save
r2.save
