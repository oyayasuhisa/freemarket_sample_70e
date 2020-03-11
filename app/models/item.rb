class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_size
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_pay
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :postage_ty

  validates :name, length: { in: 1..40 }
  validates :item_description, length: { in: 1..1000 }

  with_options presence: true do
    validates :category_id
    validates :size
    validates :item_condition
    validates :postage_payer
    validates :postage_type
    validates :prefecture_code
    validates :estimated_shipping_date
    validates :price
    validates :trading_status
  end
  
  has_many :item_images
  has_many :comments
  has_many :favorites
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category

  accepts_nested_attributes_for :item_images, allow_destroy: true
end
