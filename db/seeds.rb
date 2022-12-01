# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Asso.destroy_all

user1 = User.create!(email: "user1@gmail.com", password: 'password', name: 'Toto')
user2 = User.create!(email: "user2@gmail.com", password: 'password', name: 'Titi')

day1 = Day.create!()

file_l214 = URI.open('https://res.cloudinary.com/dwvsbgwap/image/upload/v1669805933/L214_hzeihf.png')
asso_l214 = Asso.new(name: "L214", description: "L214 est une association de défense des animaux utilisés comme ressources alimentaires.", url: "https://www.l214.com/")
asso_l214.photo.attach(io: file_l214, filename: "L214.png", content_type: "image/png")
asso_l214.save

file_wwf = URI.open('https://res.cloudinary.com/dwvsbgwap/image/upload/v1669805933/wwf_xagehj.png')
asso_wwf = Asso.new(name: "WWF", description: "Le WWF œuvre pour préserver les régions et espèces sauvages menacées.", url: "https://www.wwf.fr/")
asso_wwf.photo.attach(io: file_wwf, filename: "WFF.png", content_type: "image/png")
asso_wwf.save

file_apa = URI.open('https://res.cloudinary.com/dwvsbgwap/image/upload/v1669805934/APA_vaimhp.png')
asso_apa = Asso.new(name: "APA", description: "Action Protection Animale est une organisation réactive et de terrain qui lutte contre la maltraitance dans sa globalité.", url: "https://www.actionprotectionanimale.com/lapa/")
asso_apa.photo.attach(io: file_apa, filename: "APA.png", content_type: "image/png")
asso_apa.save

file_greenpeace = URI.open('https://res.cloudinary.com/dwvsbgwap/image/upload/v1669818392/greenpeacecarre_r5tfyc.png')
asso_greenpeace = Asso.new(name: "Greenpeace", description: "Greenpeace est une organisation internationale de protection de l'environnement.", url: "https://www.greenpeace.fr/")
asso_greenpeace.photo.attach(io: file_greenpeace, filename: "greenpeace.png", content_type: "image/png")
asso_greenpeace.save

file_fao = URI.open('https://res.cloudinary.com/dwvsbgwap/image/upload/v1669806814/FAO_omhbki.png')
asso_fao = Asso.new(name: "FAO", description: "L'Organisation des Nations unies pour l'alimentation et l'agriculture.", url: "https://www.fao.org/home/fr")
asso_fao.photo.attach(io: file_fao, filename: "FAO.png", content_type: "image/png")
asso_fao.save

file_b12 = URI.open('https://res.cloudinary.com/dwvsbgwap/image/upload/v1669805934/Vivelab12_wvx9ja.jpg')
asso_b12 = Asso.new(name: "B12", description: "Prévention par la Société végane française de l'importance de la supplémentation en vitamine B12.", url: "https://www.vivelab12.fr/")
asso_b12.photo.attach(io: file_b12, filename: "B12.png", content_type: "image/png")
asso_b12.save

# Données pour chaque type de viande (inchangeable)

Meat.destroy_all

boeuf = Meat.create(meat_type: "boeuf", water_impact: 120, carbon_impact: 130, tree_impact: 4, animal_impact: 3)
poulet = Meat.create(meat_type: "poulet", water_impact: 25, carbon_impact: 45, tree_impact: 3, animal_impact: 2)
porc = Meat.create(meat_type: "porc", water_impact: 52, carbon_impact: 70, tree_impact: 4, animal_impact: 3)
mouton = Meat.create(meat_type: "mouton", water_impact: 30, carbon_impact: 30, tree_impact: 2, animal_impact: 1)
poisson = Meat.create(meat_type: "poisson", water_impact: 2, carbon_impact: 10, tree_impact: 0, animal_impact: 1)
vege = Meat.create(meat_type: "vegetarien", water_impact: 0, carbon_impact: 0, tree_impact: 0, animal_impact: 0)

# La première semaine de toto

Day.destroy_all

day1 = Day.create(date: 20221122, user: user1)
day2 = Day.create(date: 20221123, user: user1)
day3 = Day.create(date: 20221124, user: user1)
day4 = Day.create(date: 20221125, user: user1)
day5 = Day.create(date: 20221126, user: user1)
day6 = Day.create(date: 20221127, user: user1)
day7 = Day.create(date: 20221128, user: user1)

Conso.destroy_all

# Lundi (day1), toto mange 2 conso (conso1 et conso2), ce qui donne 600g de boeuf et 200g de poulet

conso1 = Conso.create(quantity: 600, meat: boeuf, day: day1)
conso2 = Conso.create(quantity: 200, meat: poulet, day: day1)

# Mardi (day2), toto mange 2 conso (conso3 et conso4), ce qui donne 400g de porc et 150g de mouton

conso3 = Conso.create(quantity: 400, meat: porc, day: day2)
conso4 = Conso.create(quantity: 150, meat: mouton, day: day2)

# Mercredi (day3), toto mange 1 conso (conso5), ce qui donne 800g de poisson sur la journée.
conso5 = Conso.create(quantity: 800, meat: poisson, day: day3)

# Jeudi (day4), toto ne mange pas de viande du tout
conso6 = Conso.create(quantity: 0, meat: vege, day: day4)

# Vendredi (day5), toto mange 3 conso (conso 7, 8 et 9), ce qui donne 300g de poulet, 200g de boeuf et 200g de poisson
conso7 = Conso.create(quantity: 300, meat: poulet, day: day5)
conso8 = Conso.create(quantity: 200, meat: boeuf, day: day5)
conso9 = Conso.create(quantity: 200, meat: poisson, day: day5)

# Samedi (day6), toto ne mange pas de viande
conso10 = Conso.create(quantity: 0, meat: vege, day: day6)

# Dimanche (day7), toto mange peu de viande, 100g de poulet

conso11 = Conso.create(quantity: 100, meat: poulet, day: day7)
