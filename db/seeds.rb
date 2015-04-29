# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
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
end


