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
addresses = ['32 Rothschild Boulevard, Tel Aviv', '70 Rothschild Boulevard, Tel Aviv', '10 Rothschild Boulevard, Tel Aviv', '32 Ben Yehuda, Tel Aviv', '10 Ben Yehuda, Tel Aviv', '100 Ben Yehuda, Tel Aviv', '1 Ben Yehuda, Tel Aviv', '32 Allenby, Tel Aviv', '1 Allenby, Tel Aviv','55 Allenby, Tel Aviv', 'Elbchaussee 1, Hamburg', 'Jungfernstieg 1, Hamburg', 'Reeperbahn 50, Hamburg', 'Hallerstrasse 10, Hamburg', 'Turmstrasse 2, Hamburg', 'Waitzstrasse 20, Hamburg', 'Neuer Jungfernstieg 20, Hamburg', 'Elbchausse 100, Hamburg', 'Neuer Wall 1, Hamburg', 'Neuer Wall 30, Hamburg']
20.times do
  user = User.create(email: Faker::Internet.email, name: Faker::FunnyName.name, password: Faker::Alphanumeric.alpha(number: 10), remote_avatar_url: "https://source.unsplash.com/collection/566311/#{rand(1..268)}")
  boyfriend = Boyfriend.create!(name: Faker::Name.male_first_name + " " + Faker::Name.last_name, description: Faker::Quote.famous_last_words,
    likes: rand(10000..45000), location: addresses.sample, height: rand(160..210),

    smartphone_model: Faker::Device.model_name, pet: Faker::Creature::Animal.name, user: user, price: rand(50..2000))
  3.times do
    image = Image.create!(boyfriend: boyfriend, remote_link_url: "https://source.unsplash.com/collection/2303600/#{rand(1..268)}")
  end

  image = Image.create!(boyfriend: boyfriend, remote_link_url: "https://source.unsplash.com/collection/2303600/#{rand(1..268)}")
end

Boyfriend.all.each do |boyfriend|
  5.times do
    Review.create!(description: Faker::Quote.most_interesting_man_in_the_world, rating: rand(1..5), user: User.all.sample, boyfriend: boyfriend)
  end
end

