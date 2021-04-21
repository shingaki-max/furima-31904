class Address < ApplicationRecord
  belongs_to  :purchase
  validates :postal_code, :prefecture_id, :municipalities, :address, :phone_number, presence: true
end
