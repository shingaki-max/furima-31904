class Address < ApplicationRecord
  belongs_to  :purchase
  validates :postal_code, :prefecture_id, :municipalities, :address, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
  validates :phone_number, numericality: true, length: { maximum: 11 }
end
