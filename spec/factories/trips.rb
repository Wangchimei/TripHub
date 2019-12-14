FactoryBot.define do
  factory :trip do
    association :user
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { DateTime.now }
    end_day { DateTime.now + 2 }
    status { 0 }
    privacy { false }
    est_amount { 1000 }
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
  end
end