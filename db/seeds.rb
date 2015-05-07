# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#   Mayor.create(name: 'Emanuel', city: cities.first)


Business.create!({
  name: "Le Dindon en Laisse",
  description: "Resto Bio",
  street: "18 Rue Beautreillis",
  zipcode: "75004",
  city: "Paris"
})

Business.create!({
  name: "MyFreeKitchen",
  description: "Sans Gluten",
  street: "1 Bis Rue Bleue Paris",
  zipcode: "75009",
  city: "Paris"
})
Business.create!({
  name: "La Verierre",
  description: "Sans Gluten",
  street: "24 avenue de Tourville",
  zipcode: "75007",
  city: "Paris"
})



Business.create!(
  name:        Faker::Company.name,
  description: Faker::Lorem.sentence(word_count = 20, supplemental = false, random_words_to_add = 10),
  street:      Faker::Address.street_address,
  zipcode:     Faker::Address.zip_code,
  city:        Faker::Address.city,
  url:         Faker::Internet.url,
  picture:     Faker::Avatar.image("my-own-slug", "50x50", "jpg"),
  facebook:    Faker::Internet.url,
  twitter:     Faker::Internet.url,
  instagram:   Faker::Internet.url,
  telephone:   Faker::PhoneNumber.phone_number,
  latitude:    Faker::Address.latitude,
  longitude:   Faker::Address.longitude
)


