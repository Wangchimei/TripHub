FactoryBot.define do
  factory :schedule do
    association :trip
    association :spot
    name {"東京タワー"}
    admission_fee { 1200 }
    other_cost { 2000 }
    duration { 60 }
  end
end