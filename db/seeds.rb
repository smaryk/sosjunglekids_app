# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name:  "Example",
             last_name: "User",
             email: "example@gmail.com",
             password:              "letmein",
             password_confirmation: "letmein",
             admin:     true)

30.times do |n|
  name  = Faker::Name.first_name
  last  = Faker::Name.last_name
  email = "example-#{n+1}@sos.com"
  password = "password"
  User.create!(first_name:  name,
               last_name:  last,
              email: email,
              password:              password,
              password_confirmation: password)
end

users = User.order(:created_at).take(6)
2.times do
  content = Faker::Lorem.sentence(6)

  name  = Faker::Name.first_name
  last  = Faker::Name.last_name
  add = "address Dhanwar, CH"

  users.each { |user| 

    user.newsposts.create!(content: content) 
    user.students.create!(
               first_name:  name,
               last_name:  last,
               address: add,
               class_code: "CL1"

    )

  }

  
end


