require 'faker'

puts "Nettoyage de la base de donnée"

User.destroy_all

puts "Création des utilisateurs"

# ------ Création de 3 utilisateurs ----------------------------------
user1 = User.create(email: 'user1@example.com', password: 'azerty')
user2 = User.create(email: 'user2@example.com', password: 'azerty')
user3 = User.create(email: 'user3@example.com', password: 'azerty')


# ------ Création de 15 voitures -------------------------------------
15.times do
  Car.create(
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year_of_production: Faker::Vehicle.year,
    address: "#{Faker::Address.street_address} #{Faker::Address.city}",
    price_per_day: Faker::Number.between(from: 15, to: 100),
    user: [user1, user2, user3].sample
  )
end

# ------ Création de 10 bookings -------------------------------------
10.times do
  Booking.create(
    starts_at: Date.today + rand(30).days,
    ends_at: Date.today + rand(30).days + rand(20).days,
    accepted: [true, false].sample,
    user: [user1, user2, user3].sample,
    car: Car.all.sample
  )
end

puts 'Seed créé :)'
