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
