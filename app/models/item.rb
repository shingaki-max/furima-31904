class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :send_date

 # validates :item_name, :category_id, :price, :image, :description, :shipping_charge_id,  :state_id, :prefecture_id, :send_date_id, :price
  validates :item_name, :image, :description, presence: true
  validates :category_id, :shipping_charge_id, :state_id, :prefecture_id, :send_date_id, numericality: { greater_than: 1} ,presence: true 

  validates :price, presence: true, inclusion: { in: 300..9999999 }

  belongs_to :user
end
