# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new
u1.name = "Jonathan"
u1.surname = "HURTER"
u1.promo = 2017
u1.phone = "0123456789"
u1.email = "test@test.tld"
u1.password = "john1234"
u1.approved = true
u1.save!

u2 = User.new
u2.name = "Maxime"
u2.surname = "CHICOIS"
u2.promo = 2017
u2.phone = "0123456789"
u2.email = "test2@test2.tld"
u2.password = "chicois1234"
u2.approved = false
u2.save!
