FactoryBot.define do
  factory :item do
    item_name { 'taro' }
    category_id { 2 }
    price { 2000 }
    description { '佐藤' }
    state_id { 2 }
    prefecture_id { 2 }
    send_date_id { 2 }
    shipping_charge_id { 2 }
    association :user 
    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
