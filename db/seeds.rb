# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Vuong Hung", email: "vuonghung@gmail.com",
      password: "hung123", password_confirmation: "hung123", admin: true)

50.times do |i|
  name = Faker::Name.name
  email = "sample-#{i+1}@tutorial.com"
  password = "password"
  User.create!(name: name, email: email, password: password, password_confirmation: password)
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each do |followed|
  user.follow(followed)
end
followers.each do |follower|
  follower.follow(user)
end
