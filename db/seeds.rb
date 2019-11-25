# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
puts "Destroying all reviews"

Booking.destroy_all
puts "Destroying all bookings"

Image.destroy_all
puts "Destroying all images"

Boyfriend.destroy_all
puts "Destroying all boyfriends"

User.destroy_all
puts "Destroying all users"

10.times do
  user = User.create(email: Faker::Internet.email, name: Faker::FunnyName.name, password: Faker::Alphanumeric.alpha(number: 10))
  boyfriend = Boyfriend.create!(name: Faker::Name.name, description: Faker::Superhero.name,
    likes: rand(10000..45000), location: Faker::Nation.capital_city, height: rand(160..210),
    smartphone_model: Faker::Device.model_name, pet: Faker::Creature::Animal.name, user: user)
  3.times do
    Review.create!(description: Faker::Quote.most_interesting_man_in_the_world, rating: rand(1..5), user: user, boyfriend: boyfriend)
  end
end
