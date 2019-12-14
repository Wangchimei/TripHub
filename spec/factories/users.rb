FactoryBot.define do
  factory :user do
    association :country
    association :state
    association :city
    name { "Shiba" }
    email { "shiba@dic.com" }
    password { "shibaa" }
  end

  factory :second_user, class: User do
    association :country
    association :state
    association :city
    name { "Chiitan" }
    email { "chiitan@dic.com" }
    password { "chiitan" }
  end
end