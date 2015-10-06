# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end


users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

users = User.order(:created_at).take(6)
50.times do 
  content = Faker::Lorem.paragraph(4, true, 4)
  title = Faker::Book.title
  start_date = Faker::Date.backward(1000)
  end_date = Faker::Date.backward(993)
  event_location = Faker::Address.street_address
  event_lat = Faker::Address.latitude
  event_long = Faker::Address.longitude
  users.each { |user| user.events.create!(content: content, title: title, event_location: event_location, start_date: start_date, end_date: end_date) }
end