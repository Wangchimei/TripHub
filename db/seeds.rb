25.times do |user|
  name = Faker::Name.unique.name
  email = "user_#{user+1}@dic.com"
  password = "testtest"
  date = Faker::Date.backward(days: 30)
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    country_id: 109,
    state_id: 823,
    city_id: 64316,
    created_at: date,
    avatar: nil
  )
end

50.times do |trip|
  name = Faker::Lorem.sentence(word_count: 3)
  description = Faker::Lorem.paragraph
  trip_image = "https://source.unsplash.com/user/jeremybishop/500x500"
  start_day = Faker::Date.backward(days: 1)
  end_day = Faker::Date.forward(days: 1)
  status = rand(2)
  privacy = [true, false].sample
  user_id = rand(1..25)
  Trip.create!(
    name: name,
    description: description,
    trip_image: trip_image,
    start_day: start_day,
    end_day: end_day,
    status: status,
    privacy: privacy,
    user_id: user_id,
    to_countries_attributes: [
      country_id: 216
    ],
    to_states_attributes: [
      state_id: 3422
    ],
  )
end