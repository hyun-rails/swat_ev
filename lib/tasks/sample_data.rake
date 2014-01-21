namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Administrator",
                 email: "info@swatclassrec.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    
    5.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@swarthmore.edu"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 15)
    10.times do
      content = Faker::Lorem.sentence(5)
      department = Faker::Lorem.sentence(1)
      professor = Faker::Name.name
      title = Faker::Lorem.sentence(1)
      course = Faker::Lorem.sentence(1)
      difficulty = "Easy"
      lecturequality = "Good"
      accessibility = "Accessible"
      users.each { |user| user.posts.create!(department: department, 
                   professor: professor, course: course, title: title, content: content,
                   difficulty: difficulty, lecturequality: lecturequality, accessibility: accessibility) }
    end
    
  end
end