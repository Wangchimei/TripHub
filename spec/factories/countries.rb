FactoryBot.define do
  factory :country do
    name { "Japan" }
    iso2 { "JP" }
    iso3 { "JPN" }
    capital { "Tokyo" }
    currency { "JPY" }
    latitude { 36.5748441 }
    longitude { 139.2394179 }
    continent
  end

  factory :second_country, class: Country do
    name { "Taiwan" }
    iso2 { "TW" }
    iso3 { "TWN" }
    capital { "Taipei" }
    currency { "TWD" }
    latitude { 23.59829785 }
    longitude { 120.8353631 }
    continent
  end
end