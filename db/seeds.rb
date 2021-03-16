# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
Agency.create(email: "test#{i + 1}@test.com", password: "testtest", name: "agence#{i + 1}", city: "Lyon", adress: "0#{i + 1} rue de la Location", phone_number: "06.42.24.42.2#{i + 1}", siren: Faker::Number.number(digits: 9))
end



3.times do |i|
  Building.create(name: "Building#{i + 1}", agency_id: 1, adress: "0#{i + 1} rue de la République", reference: "charman cottage avec #{i + 1} salle de bain et #{i + 25} fenêtres", picture: "https://www.architecture-art-deco.fr/FR/69000/Lyon/medium/Immeuble%20Art%20Deco%20Rue%20Tete%20d-or%20No5%2001.jpg")
  Building.create(name: "Building#{i + 4}", agency_id: 2, adress: "0#{i + 4} rue de la République", reference: "charman cottage avec #{i + 4} salle de bain et #{i + 5} fenêtres", picture: "https://www.illico-travaux.com/wp-content/uploads/2018/02/Immeuble2.jpg")
  Building.create(name: "Building#{i + 7}", agency_id: 3, adress: "0#{i + 7} rue de la République", reference: "charman cottage avec #{i + 5} salle de bain et #{i + 2} fenêtres", picture: "https://www.lyonmag.com/media/images/part-dieu-ok2.jpg")
end

3.times do |i|
  Owner.create(building_id: 1, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "07.42.24.42.2#{i + 1}", email: "owner_test#{i + 1}@gmail.com", password: "testtest", lot: "#{i + 1}")
  Owner.create(building_id: 3, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "07.42.24.42.2#{i + 2}", email: "owner_test#{i + 2}@gmail.com", password: "testtest", lot: "#{i + 2}")
  Owner.create(building_id: 6, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "07.42.24.42.2#{i + 3}", email: "owner_test#{i + 3}@gmail.com", password: "testtest", lot: "#{i + 3}")
  Owner.create(building_id: 9, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: "07.42.24.42.2#{i + 4}", email: "owner_test#{i + 4}@gmail.com", password: "testtest", lot: "#{i + 4}")
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
