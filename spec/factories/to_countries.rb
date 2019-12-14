FactoryBot.define do
  factory :to_countries, class: 'ToCountry' do
    association :trip
    association :country
  end
end
