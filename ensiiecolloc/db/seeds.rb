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
u1.admin = true
u1.save!

u2 = User.new
u2.name = "Maxime"
u2.surname = "CHICOIS"
u2.promo = 2017
u2.phone = "0123456789"
u2.email = "test2@test2.tld"
u2.password = "chicois1234"
u2.approved = true
u2.save!

u3 = User.new
u3.name = "Bastien"
u3.surname = "HAGENBACH"
u3.promo = 2017
u3.phone = "0123456789"
u3.email = "bastien@hag.fr"
u3.password = "azertyuiop"
u3.approved = true
u3.save!

u4 = User.new
u4.name = "Pauline"
u4.surname = "KOBERSI"
u4.promo = 2017
u4.phone = "0123456789"
u4.email = "p@k.fr"
u4.password = "azertyuiop"
u4.approved = true
u4.save!

u5 = User.new
u5.name = "Damien"
u5.surname = "THEODORI"
u5.promo = 2017
u5.phone = "0123456789"
u5.email = "dam.tmtc@gmail.com"
u5.password = "azertyuiop"
u5.approved = true
u5.save!

u6 = User.new
u6.name = "Aurelie"
u6.surname = "PALLAS"
u6.promo = 2017
u6.phone = "0123456789"
u6.email = "aur.pal@free.fr"
u6.password = "azertyuiop"
u6.approved = true
u6.save!

c1 = Colloc.new
c1.titre = "Colloc de john"
c1.adresse = "2 rue des juifs Strasbourg"
c1.size = 200
c1.chambres = 2
c1.max_people = 2
c1.price = 250
c1.save!

c2 = Colloc.new
c2.titre = "Geek Colloc"
c2.adresse = "1 quai saint nicolas Strasbourg"
c2.size = 400
c2.chambres = 4
c2.max_people = 4
c2.price = 600
c2.save!

c3 = Colloc.new
c3.titre = "La future collocation de tes reves que tu de demande pourquoi tu y es pas encore"
c3.adresse = "50 Avenue de la foret noire Strasbourg"
c3.size = 350
c3.chambres = 3
c3.max_people = 3
c3.price = 250
c3.save!

c4 = Colloc.new
c4.titre = "Real colloc"
c4.adresse = "6 rue schwendi Strasbourg"
c4.size = 50
c4.chambres = 2
c4.max_people = 4
c4.price = 250
c4.save!

c5 = Colloc.new
c5.titre = "Ma colloc"
c5.adresse = "2 quai jacoutot Strasbourg"
c5.size = 70
c5.chambres = 3
c5.max_people = 3
c5.price = 150
c5.save!

c6 = Colloc.new
c6.titre = "TheOne Colloc"
c6.adresse = "1 Faubourg de saverne Strasbourg"
c6.size = 100
c6.chambres = 5
c6.max_people = 10
c6.price = 250
c6.save!

u1.add_colloc c1
u1.save!

u2.add_colloc c2
u2.save!

u2.add_colloc c2
u2.save!

u3.add_colloc c3
u3.save!

u4.add_colloc c4
u4.save!

u5.add_colloc c5
u5.save!

u6.add_colloc c6
u6.save!
