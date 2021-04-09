class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :send_date

  validates :item_name, :category_id, :price, :image, :description, :shipping_charge_id,  :state_id, :prefecture_id, :send_date_id, :price, presence: true
  validates :price, numericality: { in: 300..9999999 }
end
