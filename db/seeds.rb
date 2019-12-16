25.times do |user|
  name = Faker::Name.first_name
  email = Faker::Internet.safe_email(name: name)
  password = "testtest"
  date = Faker::Date.backward(days: 200)
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              created_at: date,
              avatar: nil)
end

25.times do |user|
  name = Faker::Name.first_name
  email = Faker::Internet.safe_email(name: name)
  password = "testtest"
  date = Faker::Date.backward(days: 200)
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              created_at: date,
              avatar: nil)
end