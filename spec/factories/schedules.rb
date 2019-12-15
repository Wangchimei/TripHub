FactoryBot.define do
  factory :schedule do
    name {"東京タワー"}
    start_time { "2019-12-15 10:00" }
    end_time { "2019-12-15 14:00" }
    admission_fee { 1200 }
    other_cost { 2000 }
    trip
    spot
  end

  factory :second_schedule, class: Schedule do
    name {"台北101展望台"}
    start_time { "2019-12-15 10:00" }
    end_time { "2019-12-15 14:00" }
    admission_fee { 2200 }
    other_cost { 2000 }
    trip
    spot
  end
end