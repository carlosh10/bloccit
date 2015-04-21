# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

#create posts
50.times do 
  @title = Faker::Lorem.sentence
  Post.create!(
    user: users.sample,
    title: @title,
    body: Faker::Lorem.paragraph
  ) unless  Post.where(title: @title).first
end
posts = Post.all

#Create Comments

100.times do
  Comment.create!(
    #user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  ) 
end
posts = Comment.all

100.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    price: Faker::Number.digit,
    copy: Faker::Lorem.sentence,
  ) 
end

100.times do
  Question.create!(
    title: Faker::Lorem.sentence,
    resolved: false,
    body: Faker::Lorem.sentence,
  ) 
end
questions = Question.all



user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'carlos@comex.guru',
  password: 'artemis10'
  )


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{User.count} users created"

