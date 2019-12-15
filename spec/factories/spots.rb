FactoryBot.define do
  factory :spot do
    name { "東京タワー" }
    address { "〒105-0011 東京都港区芝公園４丁目２−８" }
    admission_fee { 1200 }
    latitude { 35.6585805 }
    longitude { 139.7454329 }
    main_image { "https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwNDMxNH0&utm_source=triphub_app&utm_medium=referral&utm_campaign=api-credit" }
    formatted_name { "Tokyo Tower" }
    formatted_address { "4-chōme-2-8 Shibakōen, Minato City, Tōkyō-to 105-0011, Japan" }
    phone_num { "+81 3-3433-5111" }
    rating { 4.4 }
    website { "https://www.tokyotower.co.jp/" }
    place_id { "ChIJCewJkL2LGGAR3Qmk0vCTGkg" }
  end

  factory :second_spot, class: Spot do
    name { "台北101展望台" }
    address { "110 台湾 Taipei City, Xinyi District, Section 5, Xinyi Road, 7號89樓/110樓" }
    admission_fee { 2200 }
    latitude { 25.0339639 }
    longitude { 121.5644722 }
    main_image { "https://images.unsplash.com/photo-1563125569-f4a59e9f9311" }
    formatted_name { "Taipei 101 Observatory" }
    formatted_address { "110, Taiwan, Taipei City, Xinyi District, Section 5, Xinyi Road, 7號89樓/110樓" }
    phone_num { "+886 2 8101 8898" }
    rating { 4.4 }
    website { "http://www.taipei-101.com.tw/tw/observatory-info.aspx" }
    place_id { "ChIJSTLZ6barQjQRMdkCqrP3CNU" }
  end
end