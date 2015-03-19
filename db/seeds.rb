# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! name: "Vuong Hung", email: "vuonghung@gmail.com",
      password: "hung123", password_confirmation: "hung123", admin: true

50.times do |i|
  name = Faker::Name.name
  email = "sample-#{i+1}@tutorial.com"
  password = "password"
  User.create! name: name, email: email, password: password, password_confirmation: password
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}

2.times do |n|
  category_title = "Category #{n+1}"
  category_content = Faker::Lorem.sentence 5
  Category.create! title: category_title, content: category_content
end

categories = Category.all
categories.each do |category|
  10.times do |n|
    word_content = "Word #{category.id}.#{n+1}"
    category.words.create! content: word_content
  end
end

words = Word.all
words.each do |word|
  4.times do |n|
    answer_content = "Answer #{word.category_id}.#{word.id}.#{n+1}"
    if n == 1
      word.answers.create! content: answer_content, correct: true
    else
      word.answers.create! content: answer_content
    end
  end
end

user = User.first
category = Category.first
lesson = user.lessons.create!(category_id: category.id)
category.words.each_with_index do |word, index|
  answer = word.answers.first
  lesson.results.create!(word_id: word.id, answer_id: answer.id)
  if index == 5 then break
  end
end
