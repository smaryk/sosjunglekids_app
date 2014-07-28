namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Example",
                 last_name: "User",
                 email: "example@sosjunglekids.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true )
    users = User.all(limit: 2)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.newsposts.create!(content: content) }
    end
    99.times do |n|
      first_name  = Faker::Name.first_name
      last_name   = Faker::Name.last_name
      email = "example-#{n+1}@sosjunglekids.com"
      password  = "password"
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password,
                   password_confirmation: password
                  )
    end
  end
end
