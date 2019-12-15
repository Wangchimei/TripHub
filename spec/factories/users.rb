FactoryBot.define do
  factory :user do
    name { "Shiba" }
    email { "shiba@dic.com" }
    password { "shibaa" }
    country
    state
    city
  end

  factory :second_user, class: User do
    name { "Chiitan" }
    email { "chiitan@dic.com" }
    password { "chiitan" }
    country
    state
    city
  end

  factory :third_user, class: User do
    name { "Butters" }
    email { "butters@dic.com" }
    password { "butters" }
    country
    state
    city
  end
end