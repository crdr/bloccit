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
    user.save!
end
users = User.all

# Note: by calling 'User.new' instead of 'create',
#we create an instance of User which isn't immediately saved to the database.

#The 'skip_confirmation!' method sets the 'confirmed_at' attribute
#to avoid triggering a confirmation email when the User is saved.

if Topic.where(title: "title", description: "unique_description").count == 0
    Topic.create!(title: "title", description: "unique_description")
end
50.times do 
        Topic.create!(
            title: Faker::Lorem.sentence, 
            description:  Faker::Lorem.paragraph
            )
end

topics = Topic.all

#The 'save' method then saves this User to the database.
# Create Posts 
if Post.where(title: "title", body: "unique_body").count == 0
    Post.create!(title: "title", body: "unique_body")
end
50.times do 
        Post.create!(
            user: users.sample,
            topic: users.sample,
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

user = User.first
user.update_attributes!(
    email: 'carmikerdreid@gmail.com',
    password: 'helloworld',
    password_confirmation: 'helloworld'
    )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

# Create an admin user
admin = User.new(
    name:   'Admin User',
    email:  'admin@example.com',
    password: 'helloworld',
    role:     'admin'
)
admin.save!

# Create a moderator
moderator = User.new(
    name:   'Moderator User',
    email:  'moderator@example.com',
    password: 'helloworld',
    role:     'moderator'
)
moderator.save!

# Create a member
member = User.new(
   name:    'Member User',
   email:   'member@example.com',
   password: 'helloworld'
)
member.save!

