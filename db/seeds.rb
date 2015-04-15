# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

#create posts
50.times do 
  @title = Faker::Lorem.sentence
  Post.create!(
    title: @title,
    body: Faker::Lorem.paragraph
  ) unless  Post.where(title: @title).first
end
posts = Post.all

#Create Comments

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  ) 
end

100.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    price: Faker::Number.digit,
    copy: Faker::Lorem.sentence,
  ) 
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
