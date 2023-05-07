# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

5.times do
  city = City.order("RANDOM()").first
  flat = Flat.create!(available_beds: Faker::Number.within(range: 1..10), price: Faker::Number.decimal(l_digits: 2), description: Faker::Construction.material, has_wifi: Faker::Boolean.boolean, welcome_msg: Faker::TvShows::BigBangTheory.quote, city: city)
end

#création patients random
5.times do
  city = City.order("RANDOM()").first
  user = User.create!(email: Faker::Internet.email, phonenumber: Faker::Number.leading_zero_number(digits: 10), description: Faker::TvShows::BigBangTheory.character, city: city)
end

5.times do
  flat = Flat.order("RANDOM()").first
  user = User.order("RANDOM()").first
  city = City.order("RANDOM()").first
  start_date = Faker::Time.between(from: DateTime.now - 10, to: DateTime.now).strftime("%Y-%m-%d %H:%M:%S")
  start_date = DateTime.parse(start_date)
  end_date = Faker::Time.between(from: start_date, to: start_date + 30.days).strftime("%Y-%m-%d %H:%M:%S")
  reservation = Reservation.create!(start_date: start_date, flat: flat, user: user)
  reservation.update(end_date: end_date)
end
