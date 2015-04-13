# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(name: "Greg", email:"greg@greg.com", password:"12345")
User.create!(name: "bill", email:"bill@xxx.com", password:"12345")
User.create!(name: "sally", email:"sally@xxx.com", password:"12345")

Gym.create!(name:"cool gym", address: "1234 lane")
Gym.create!(name:"lame gym", address: "000 lane")


greg = User.find_by_email("greg@greg.com")
gym = Gym.find_by_name("cool gym")

Membership.create!(user_id: greg.id, gym_id: gym.id)

