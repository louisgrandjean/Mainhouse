# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Agency.destroy_all
Building.destroy_all
Message.destroy_all
Owner.destroy_all
Event.destroy_all

5.times do |i|
Agency.create(email: "test#{i + 1}@test.com", password: "testtest", name: "agence#{i + 1}", city: "Lyon", adress: "0#{i + 1} rue de la Location", phone_number: "064224422#{i + 1}", siren: Faker::Number.number(digits: 9))
end



5.times do |i|
  Building.create(name: "Building 1", agency_id: i, adress: "39 rue de du Maréchal", reference: Faker::Number.hexadecimal(digits: 6), picture: "https://www.fibra-award.org/wp-content/uploads/2018/11/31-Rue-Myrha-825x510.jpg", city: "Lyon", zip_code: "69002")
  Building.create(name: "Building 2", agency_id: i, adress: "02 rue de la République", reference: Faker::Number.hexadecimal(digits: 6), picture: "https://www.fournisseur-energie.com/blog/wp-content/uploads/2020/05/ravalement-fa%C3%A7ade-immeuble-825x510.jpg", city: "Lyon", zip_code: "69001")
  Building.create(name: "Building 3", agency_id: i, adress: "16 avenue de la Pie", reference: Faker::Number.hexadecimal(digits: 6), picture: "https://fr-architectes.com/wp-content/uploads/2020/03/P-01-vaucanson-825x510.jpg", city: "Lyon", zip_code: "69003")
  Building.create(name: "Building 4", agency_id: i, adress: "67 rue de la Vieille", reference: Faker::Number.hexadecimal(digits: 6), picture: "https://fr-architectes.com/wp-content/uploads/2015/05/IMG_6604-825x510.jpg", city: "Lyon", zip_code: "69002")
  Building.create(name: "Building 5", agency_id: i, adress: "05 rue Orange", reference: Faker::Number.hexadecimal(digits: 6), picture: "https://www.fibra-award.org/wp-content/uploads/2019/09/C11_North-by-Northwest_P10200702-825x510.jpg", city: "Lyon", zip_code: "69006")
  Building.create(name: "Building 6", agency_id: i, adress: "06 chemin de l'Arbre Moche", reference: Faker::Number.hexadecimal(digits: 6), picture: "http://www.tla-architectes.com/wp-content/uploads/2020/08/nouvelle_archietcture_Aqublu-825x510.jpg", city: "Lyon", zip_code: "69005")
  Building.create(name: "Building 7", agency_id: i, adress: "98 rue de la Marmotte", reference: Faker::Number.hexadecimal(digits: 6), picture: "https://cdn.shortpixel.ai/client/q_glossy,ret_img/https://simulateur-pret-hypothecaire.be/wp-content/uploads/2019/01/flensburg-2380551_960_720-825x510.jpg", city: "Lyon", zip_code: "69008")
  Building.create(name: "Building 8", agency_id: i, adress: "17 avenue Leclerc", reference: Faker::Number.hexadecimal(digits: 6), picture: "https://www.fibra-award.org/wp-content/uploads/2018/11/07-Nantes-f6_LAD_illustration-parti-pris_2_small-825x510.jpg", city: "Lyon", zip_code: "69007")
  Building.create(name: "Building 9", agency_id: i, adress: "09 impasse du Soleil Bleu", reference: Faker::Number.hexadecimal(digits: 6), picture: "http://www.tla-architectes.com/wp-content/uploads/2020/03/projet_Teasdale-06-1-825x510.jpg", city: "Lyon", zip_code: "69005")
end

3.times do |i|
  Owner.create(building_id: 1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "074224422#{i + 1}", email: "owner_test#{i + 1}@gmail.com", password: "testtest", lot: "#{i + 1}")
  Owner.create(building_id: 3, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "074224422#{i + 2}", email: "owner_test#{i + 2}@gmail.com", password: "testtest", lot: "#{i + 2}")
  Owner.create(building_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "074224422#{i + 3}", email: "owner_test#{i + 3}@gmail.com", password: "testtest", lot: "#{i + 3}")
  Owner.create(building_id: 9, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "074224422#{i + 4}", email: "owner_test#{i + 4}@gmail.com", password: "testtest", lot: "#{i + 4}")
end



Message.create(owner_id: 1, building_id: 1, content: "Bonjour les voisins")
Message.create(owner_id: 2, building_id: 3, content: "Salut les naze")
Message.create(owner_id: 3, building_id: 6, content: "Hello world")
Message.create(owner_id: 4, building_id: 9, content: "À quand une AG ?")
Message.create(owner_id: 5, building_id: 9, content: "On en a gros")
Message.create(owner_id: 6, building_id: 9, content: "Il s'agirait de grandir")


Event.create(building_id: 1, title: "Assemblée générale", description: "Réunion formelle", datetime: Faker::Date.in_date_period(month: 2), duration: 90)
Event.create(building_id: 3, title: "Assemblée générale", description: "Réunion formelle", datetime: Faker::Date.in_date_period(month: 2), duration: 90)
Event.create(building_id: 6, title: "Assemblée générale", description: "Réunion formelle", datetime: Faker::Date.in_date_period(month: 2), duration: 90)
Event.create(building_id: 9, title: "Tournée générale", description: "Cuite formelle", datetime: Faker::Date.in_date_period(month: 2), duration: 90)
Event.create(building_id: 9, title: "Ravalement de facade", description: "On va laver la facade", datetime: Faker::Date.in_date_period(month: 2), duration: 90)
Event.create(building_id: 9, title: "Dératisation", description: "Hécatombe de rats", datetime: Faker::Date.in_date_period(month: 2), duration: 90)
