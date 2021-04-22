FactoryBot.define do
  factory :order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '横浜市緑区' }
    address { '青山1-1-1' }
    phone_number { '0901234567' }
    token {"tok_abcdefghijk00000000000000000"}
    # association :purchase
  end
end
