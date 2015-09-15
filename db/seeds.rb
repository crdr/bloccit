# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create Posts 
if Post.where(title: "title", body: "unique_body").count == 0
    Post.create!(title: "title", body: "unique_body")
end
50.times do 
        Post.create!(
            title: Faker::Lorem.sentence, 
            body:  Faker::Lorem.paragraph
            )
end
posts = Post.all

# Create Comments
if Comment.where(post:Post.first, body: "unique_body").count == 0
    Comment.create!(
        post:Post.first, body: "unique_body"
        )
end    
    100.times do 
    Comment.create!(
        post: posts.sample, 
        body: Faker::Lorem.paragraph
        )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
