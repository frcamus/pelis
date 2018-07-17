# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create(id:100, titulo: "Titanic", genero: "Drama", precio: 5000, duracion: 150)
Movie.create(id:200, titulo: "Chuky", genero: "Terror", precio: 7000, duracion: 125)
Movie.create(id:300, titulo: "Matrix", genero: "Sfi", precio: 8000, duracion: 142)

Serie.create(id:400, titulo: "Black Mirror", genero: "Sfi", precio: 10000, temporadas: 4)
Serie.create(id:500, titulo: "Breaking Bad", genero: "Drama", precio: 8000, temporadas: 5)
Serie.create(id:600, titulo: "Spartacus", genero: "Historia", precio: 7000, temporadas: 4)

User.create(id: 1000, nombre: "Franco", email: "fcamus800@gmail.com")

Arriendo.create(id: 1, user_id: 1000 , movie_id: 300, serie_id: 400)
