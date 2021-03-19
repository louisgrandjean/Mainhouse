# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Agency.create(email: "1test@test.com", password: "testtest", name: "agence1")
Agency.create(email: "2test@test.com", password: "testtest", name: "agence2")
Agency.create(email: "3test@test.com", password: "testtest", name: "agence3")


Building.create(name: "Building1", agency_id: 1)
Building.create(name: "Building2", agency_id: 3)
Building.create(name: "Building3", agency_id: 1)
Building.create(name: "Building4", agency_id: 2)
Building.create(name: "Building5", agency_id: 3)
Building.create(name: "Building6", agency_id: 1)


Owner.create(building_id: 2, first_name: "Michel", email: "test@gmail.com", password: "testtest")
Owner.create(building_id: 2, first_name: "Rodrigo", email: "test1@gmail.com", password: "testtest")
Owner.create(building_id: 2, first_name: "Marguerite", email: "test2@gmail.com", password: "testtest")
Owner.create(building_id: 3, first_name: "Josiane", email: "test3@gmail.com", password: "testtest")
Owner.create(building_id: 3, first_name: "Martin", email: "test4@gmail.com", password: "testtest")
Owner.create(building_id: 5, first_name: "Lola", email: "test5@gmail.com", password: "testtest")
Owner.create(building_id: 4, first_name: "Youpi", email: "testu@gmail.com", password: "testtest")
Owner.create(building_id: 4, first_name: "Rodriga", email: "testz@gmail.com", password: "testtest")
Owner.create(building_id: 2, first_name: "MargueritO2", email: "teste@gmail.com", password: "testtest")
Owner.create(building_id: 1, first_name: "Louis", email: "testr@gmail.com", password: "testtest")
Owner.create(building_id: 6, first_name: "Max", email: "testa@gmail.com", password: "testtest")
Owner.create(building_id: 5, first_name: "Lil Wayne", email: "testf@gmail.com", password: "testtest")




Message.create(owner_id: 4, building_id: 3, content: "bonjour les voisins")
Message.create(owner_id: 2, building_id: 2, content: "bonjour les voisins")
Message.create(owner_id: 2, building_id: 2, content: "bonjour les voisins")
Message.create(owner_id: 10, building_id: 1, content: "bonjour les voisins")
Message.create(owner_id: 10, building_id: 1, content: "bonjour les voisins")
Message.create(owner_id: 10, building_id: 1, content: "bonjour les voisins")
Message.create(owner_id: 1, building_id: 2, content: "bonjour les voisins")
Message.create(owner_id: 1, building_id: 2, content: "bonjour les voisins")
Message.create(owner_id: 1, building_id: 2, content: "bonjour les voisins")

Event.create(building_id: 1, title: "Assemblée générale")
Event.create(building_id: 2, title: "Assemblée générale")
Event.create(building_id: 3, title: "Assemblée générale")
Event.create(building_id: 4, title: "Assemblée générale")
Event.create(building_id: 5, title: "Assemblée générale")
Event.create(building_id: 6, title: "Assemblée générale")
