require 'csv'

namespace :import do
  desc "Import continents from csv"
  task continents: :environment do
    path = File.join Rails.root, "db/csv/continents.csv"
    puts "path: #{path}"
    continents = []
    CSV.foreach(path, headers: true) do |row|
      continents << {
          name: row["name"]
      }
    end
    puts "start to create continents data"
    begin
      Continent.create!(continents)
      puts "Succssfully imported continents data"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "Error : unknown attribute"
    end
  end
end

namespace :import do
  desc "Import countries from csv"
  task countries: :environment do
    path = File.join Rails.root, "db/csv/countries.csv"
    puts "path: #{path}"
    countries = []
    CSV.foreach(path, headers: true) do |row|
      countries << {
          name: row["name"],
          iso2: row["iso2"],
          iso3: row["iso3"],
          phone_code: row["phone_code"],
          capital: row["capital"],
          currency: row["currency"],
          continent_id: row["continent_id"]
      }
    end
    puts "start to create countries data"
    begin
      Country.create!(countries)
      puts "Succssfully imported countries data"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "Error : unknown attribute"
    end
  end
end

namespace :import do
  desc "Import states from csv"
  task states: :environment do
    path = File.join Rails.root, "db/csv/states.csv"
    puts "path: #{path}"
    states = []
    CSV.foreach(path, headers: true) do |row|
      states << {
          name: row["name"],
          country_code: row["country_code"],
          state_code: row["state_code"],
          country_id: row["country_id"]
      }
    end
    puts "start to create states data"
    begin
      State.create!(states)
      puts "Succssfully imported states data"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "Error : unknown attribute"
    end
  end
end

namespace :import do
  desc "Import cities from csv"

  task cities: :environment do
    path = File.join Rails.root, "db/csv/cities.csv"
    puts "path: #{path}"
    cities = []
    CSV.foreach(path, headers: true) do |row|
      cities << {
          name: row["name"],
          country_code: row["country_code"],
          state_code: row["state_code"],
          latitude: row["latitude"],
          longitude: row["longitude"],
          state_id: row["state_id"],
          country_id: row["country_id"]
      }
    end
    puts "start to create cities data"
    begin
      City.create!(cities)
      puts "Succssfully imported cities data"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "Error : unknown attribute"
    end
  end
end