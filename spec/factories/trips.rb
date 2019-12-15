FactoryBot.define do
  factory :trip do
    association :user
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { DateTime.now }
    end_day { DateTime.now + 2 }
    est_amount { 1000 }
    to_countries_attributes {[FactoryBot.attributes_for(:to_country)]}
  end

  factory :finished_trip, class: Trip do
    association :user
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { DateTime.now }
    end_day { DateTime.now + 2 }
    status { 1 }
    privacy { false }
    est_amount { 1000 }
    to_countries_attributes {[FactoryBot.attributes_for(:country)]}
  end

  factory :private_trip, class: Trip do
    association :user
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { DateTime.now }
    end_day { DateTime.now + 2 }
    status { 1 }
    privacy { true }
    est_amount { 1000 }
    to_countries_attributes {[FactoryBot.attributes_for(:country)]}
  end
end