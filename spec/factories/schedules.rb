FactoryBot.define do
  factory :schedule do
    association :trip
    association :spot
    name {"東京タワー"}
    start_time { DateTime.now }
    end_time { DateTime.now + 1.hour }
    admission_fee { 1200 }
    other_cost { 2000 }
  end

  factory :second_schedule, class: Schedule do
    association :trip
    association :spot
    name {"台北101展望台"}
    start_time { DateTime.now }
    end_time { DateTime.now + 1.hour }
    admission_fee { 2200 }
    other_cost { 2000 }
  end
end