# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


Gym.create!(name:"24 Hour Fitness", address: "1234 lane")
Gym.create!(name:"Crunch", address: "1234 lane")
Gym.create!(name:"Planet Fitness", address: "1234 lane")
Gym.create!(name:"Equinox", address: "5678 lane")



all_users = []

20.times do
  all_users << User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, thumbnail_link: Faker::Avatar.image)
end

all_users.each do |user|
    Membership.create!(user_id: user.id, gym_id: (1 + rand(3)))
end
