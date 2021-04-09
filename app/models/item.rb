class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :send_date

 # validates :item_name, :category_id, :price, :image, :description, :shipping_charge_id,  :state_id, :prefecture_id, :send_date_id, :price
  validates :item_name, :image, :description, presence: true
  validates :category_id, :shipping_charge_id, :state_id, :prefecture_id, :send_date_id, numericality: { greater_than: 1} ,presence: true 

  validates :price, presence: true, inclusion: { in: 300..9999999 }

  belongs_to :user
end
