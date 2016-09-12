# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456')

User.create(name: 'maria', email: 'admin@example.com', password: '123456', password_confirmation: '123456' )

place_names = ['Ashot BBQ&Grill', 'Moe\'s', 'GoatFather', 'The Leaky Cauldron']

for i in 0...place_names.size
  Place.create({
    name: place_names[i],
    description: FFaker::Lorem.phrase
  })
end
places = Place.all

dish_names = ['ale', 'burger', 'cake', 'chicken', 'fish', 'pasta', 'salad', 'sandwich', 'seafood', 'snacks', 'soup', 'steak']

for i in 0...dish_names.size
  dish = dish_names[i]
  Dish.create({
    :image => File.new("#{Rails.root}/app/assets/images/fixtures/#{dish}.jpg"),
    name: dish.capitalize,
    price: rand(0...20),
    place: places[rand(0...places.size)]
  })
end

