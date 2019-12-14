FactoryBot.define do
  factory :city do
    association :country
    association :state
    name { "Shibuya-ku" }
    state_code { "13" }
    country_code { "JP" }
    latitude { 35.66404 }
    longitude { 139.69821 }
  end

  factory :second_city, class: City do
    association :country
    association :state
    name { "Banqiao" }
    state_code { "TPE" }
    country_code { "TW" }
    latitude { 325.01427 }
    longitude { 121.46719 }
  end
end