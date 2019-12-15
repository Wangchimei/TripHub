FactoryBot.define do
  factory :trip do
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { DateTime.now }
    end_day { DateTime.now + 2 }
    est_amount { 1000 }
    # to_countries_attributes {[FactoryBot.attributes_for(:to_country)]}
    user
  end

  factory :finished_public_trip, class: Trip do
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { DateTime.now }
    end_day { DateTime.now + 2 }
    status { 1 }
    privacy { false }
    est_amount { 1000 }
    # to_countries_attributes {[FactoryBot.attributes_for(:country)]}
    user
  end

  factory :finished_private_trip, class: Trip do
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { DateTime.now }
    end_day { DateTime.now + 2 }
    status { 1 }
    privacy { true }
    est_amount { 1000 }
    # to_countries_attributes {[FactoryBot.attributes_for(:country)]}
    user
  end
end