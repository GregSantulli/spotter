# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name: "Greg", email:"greg@greg.com", password:"12345")
User.create!(name: "bill", email:"bill@spotter.com", password:"12345")
User.create!(name: "sally", email:"sally@spotter.com", password:"12345")
User.create!(name: "Mr. Steal Yo Girl", email:"kels@closet.com", password:"12345")
User.create!(name: "Meathead Tony", email:"jabroni@shredded.com", password:"12345")
User.create!(name: "Broseph", email:"bruh@bruh.com", password:"12345")

Gym.create!(name:"Cool Gym", address: "1234 lane")
Gym.create!(name:"Lame Gym", address: "000 lane")


greg = User.find_by_email("greg@greg.com")
kels = User.find_by_email("kels@closet.com")
kels = User.find_by_email("bruh@bruh.com")
gym = Gym.find_by_name("Cool Gym")

Membership.create!(user_id: greg.id, gym_id: gym.id)
Membership.create!(user_id: kels.id, gym_id: gym.id)
Membership.create!(user_id: kels.id, gym_id: gym.id)

