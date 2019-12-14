FactoryBot.define do
  factory :state do
    association :country
    name { "Tokyo" }
    country_code { "JP" }
    state_code { "13" }
    latitude { 35.6828387 }
    longitude { 139.7594549 }
  end

  factory :second_state, class: State do
    association :country
    name { "Taipei" }
    country_code { "TW" }
    state_code { "TPE" }
    latitude { 25.0375198 }
    longitude { 121.5636796 }
  end
end
