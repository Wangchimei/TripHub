FactoryBot.define do
  factory :trip do
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { "2019-12-15 00:00" }
    end_day { "2019-12-17 23:59" }
    est_amount { 1000 }
    user
  end

  factory :finished_public_trip, class: Trip do
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { "2019-12-15 00:00" }
    end_day { "2019-12-17 23:59" }
    status { 1 }
    privacy { false }
    est_amount { 1000 }
    user
  end

  factory :finished_private_trip, class: Trip do
    name { "Fun Trip" }
    description { "Trip is fun" }
    trip_image { "https://picsum.photos/200" }
    start_day { "2019-12-15 00:00" }
    end_day { "2019-12-17 23:59" }
    status { 1 }
    privacy { true }
    est_amount { 1000 }
    user
  end
end