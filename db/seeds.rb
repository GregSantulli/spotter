# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# all_users = []

# all_users << User.create!(name: "Greg Santulli", email: "spotter@spotter.com")
# all_users << User.create!(name: "Bill Taft", email: "spotter@spotter.com")
# all_users << User.create!(name: "Sally Mae", email: "spotter@spotter.com")
# all_users << User.create!(name: "Brian Griffin", email: "spotter@spotter.com")
# all_users << User.create!(name: "Tony Stark", email: "spotter@spotter.com")
# all_users << User.create!(name: "Joe Caruso", email: "spotter@spotter.com")
# all_users << User.create!(name: "Peter Cherry", email: "spotter@spotter.com")
# all_users << User.create!(name: "Adam Godel", email:"spotter@spotter.com")
# all_users << User.create!(name: "Kyle Cierzan", email:"spotter@spotter.com")
# all_users << User.create!(name: "Harrison Cook", email:"spotter@spotter.com")
# all_users << User.create!(name: "Will Turner", email:"spotter@spotter.com")
# all_users << User.create!(name: "Lance Armstrong", email:"spotter@spotter.com")

Gym.create!(name:"24 Hour Fitness", address: "1234 lane")
Gym.create!(name:"Crunch", address: "1234 lane")
Gym.create!(name:"Planet Fitness", address: "1234 lane")
Gym.create!(name:"Equinox", address: "5678 lane")


# greg = User.find("greg@greg.com")
# kels = User.find("kels@closet.com")
# kels = User.find("bruh@bruh.com")
# gym = Gym.find_by_name("24 Hour Fitness")

# Membership.create!(user_id: greg.id, gym_id: (1..4).sample)
# Membership.create!(user_id: kels.id, gym_id: (1..4).sample)
# Membership.create!(user_id: kels.id, gym_id: (1..4).sample)

all_users = []

20.times do
  all_users << User.create!(name: Faker::Name.name, email: Faker::Internet.email)
end

all_users.each do |user|
    Membership.create!(user_id: user.id, gym_id: (1 + rand(3)))
end
