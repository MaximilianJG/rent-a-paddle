# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"


user = User.create!({
    email: Faker::Internet.email,
    password: 123456, #Faker::Internet.password(min_length: 10, max_length: 20)
    username: Faker::Internet.username,
  })

10.times do
  file = URI.open('https://i.ytimg.com/vi/nk8K1GF2fB0/maxresdefault.jpg')
  boat = Boat.new(name: Faker::App.name, location: Faker::Address.city, description: "Shitty boat", price: 3, user_id: user.id)
  boat.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  boat.save
  puts "Created #{boat.name}!!!"
end

# user2 = User.create!({
#     email: Faker::Internet.email,
#     password: 123456, #Faker::Internet.password(min_length: 10, max_length: 20)
#     username: Faker::Internet.username,
#   })





# 10.times do
#   boat = Boat.create!(name: Faker::App.name, location: Faker::Address.city, description: "Shitty boat", price: 3, user_id: user.id)
#   puts "Created #{boat.name}!!!"
# end
