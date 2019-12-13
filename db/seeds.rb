require "csv"

puts "start to create continents data"
begin
  CSV.foreach('db/csv/continents.csv', headers: true) do |row|
    Continent.create!(
      name: row['name'],
    )
  end
  puts "Succssfully imported continents data"
rescue ActiveModel::UnknownAttributeError => invalid
  puts "Error : unknown attribute"
end

puts "start to create countries data"
begin
  CSV.foreach('db/csv/country.csv', headers: true) do |row|
    Country.create!(
      name: row["name"],
      iso2: row["iso2"],
      iso3: row["iso3"],
      capital: row["capital"],
      currency: row["currency"],
      continent_id: row["continent_id"],
      latitude: row["latitude"],
      longitude: row["longitude"]
    )
  end
  puts "Succssfully imported countries data"
rescue ActiveModel::UnknownAttributeError => invalid
  puts "Error : unknown attribute"
end

puts "start to create states data"
begin
  CSV.foreach('db/csv/state.csv', headers: true) do |row|
    State.create!(
      name: row["name"],
      country_code: row["country_code"],
      state_code: row["state_code"],
      country_id: row["country_id"],
      latitude: row["latitude"],
      longitude: row["longitude"]
    )
  end
  puts "Succssfully imported states data"
rescue ActiveModel::UnknownAttributeError => invalid
  puts "Error : unknown attribute"
end

puts "start to create cities data"
begin
  CSV.foreach('db/csv/city.csv', headers: true) do |row|
    City.create!(
      name: row["name"],
      country_code: row["country_code"],
      state_code: row["state_code"],
      latitude: row["latitude"],
      longitude: row["longitude"],
      state_id: row["state_id"],
      country_id: row["country_id"]
    )
  end
  puts "Succssfully imported cities data"
rescue ActiveModel::UnknownAttributeError => invalid
  puts "Error : unknown attribute"
end

puts "start to create spots data"
begin
  CSV.foreach('db/csv/spot.csv', headers: true) do |row|
    Spot.create!(
      name: row["name"],
      admission_fee: row["admission_fee"],
      duration: row["duration"],
      latitude: row["latitude"],
      longitude: row["longitude"],
      address: row["address"]
    )
  end
  puts "Succssfully imported spots data"
rescue ActiveModel::UnknownAttributeError => invalid
  puts "Error : unknown attribute"
end

# users dummy data
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