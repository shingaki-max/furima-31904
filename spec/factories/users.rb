FactoryBot.define do
  factory :user do
    nickname { 'taro' }
    email                 {Faker::Internet.free_email}
    password { '123456a' }
    password_confirmation { password }
    kanji_last_name { '佐藤' }
    kanji_first_name { '太郎' }
    kana_last_name { 'サトウ' }
    kana_first_name { 'タロウ' }
    birthday {'1970-12-11'}
  end
end
