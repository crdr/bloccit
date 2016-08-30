# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
#Create Users
5.times do 
    user = User.new(
        name:      Faker::Name.name,
        email:     Faker::Internet.email,
        password:  Faker::Lorem.characters(10)
        )
    user.skip_confirmation!
    user.save!
end
users = User.all

# Note: by calling 'User.new' instead of 'create',
#we create an instance of User which isn't immediately saved to the database.

#The 'skip_confirmation!' method sets the 'confirmed_at' attribute
#to avoid triggering a confirmation email when the User is saved.

#The 'save' method then saves this User to the database.
# Create Posts 
if Post.where(title: "title", body: "unique_body").count == 0
    Post.create!(title: "title", body: "unique_body")
end
50.times do 
        Post.create!(
            user: users.sample,
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
        # user: users.sample,  #we have not yet associated Users with comments 
        post: posts.sample, 
        body: Faker::Lorem.paragraph
        )
end
# Create Report
    400.times do
    Report.create!(
        post: comments.sample,
        body: Faker::Lorem.paragraph
        )
end
    
user = User.first
user.skip_confirmation!
user.update_attributes!(
    email: 'carmikerdreid@gmail.com',
    password: 'helloworld'
    )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Report.count} reports created"