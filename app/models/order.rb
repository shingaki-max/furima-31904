class Order
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :token
  validates :postal_code, :municipalities, :address, :phone_number, :token, :item_id, :user_id, presence: true
  validates :prefecture_id, numericality: { greater_than: 1} ,presence: true 
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'need -' }
  validates :phone_number, numericality: true, length: { maximum: 11 }
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name,phone_number: phone_number, purchase_id: purchase.id)
  end
end
