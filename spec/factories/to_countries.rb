FactoryBot.define do
  factory :to_country do
    association :trip
    association :country
  end
end
