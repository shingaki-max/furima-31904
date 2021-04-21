class Order
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number
  validates :postal_code, :prefecture_id, :municipalities, :address, :phone_number, presence: true

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name,phone_number: phone_number, purchase_id: purchase.id)
  end
end
