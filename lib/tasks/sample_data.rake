namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@swarthmore.edu",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@swarthmore.edu"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    40.times do
      content = Faker::Lorem.sentence(5)
      department = Faker::Lorem.sentence(1)
      professor = Faker::Name.name
      title = Faker::Lorem.sentence(1)
      course = Faker::Lorem.sentence(1)
      users.each { |user| user.posts.create!(department: department, 
                   professor: professor, course: course, title: title, content: content) }
    end
  end
end