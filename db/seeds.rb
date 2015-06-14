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

 15.times do 
    Topic.create!(
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph
     )
 end
topics = Topic.all

#create posts
50.times do 
  @title = Faker::Lorem.sentence
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: @title,
    body: Faker::Lorem.paragraph
  ) 
  #unless  Post.where(title: @title).first
  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.create_vote
  post.update_rank
end
posts = Post.all

#Create Comments

100.times do
  Comment.create!(
    user: users.sample,
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



 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 moderator = User.new(
   name:     'Moderator User',
   email:    'carlos@comex.guru',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!
 
 # Create a member
 member = User.new(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 member.skip_confirmation!
 member.save!


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"

