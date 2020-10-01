class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :images
  has_many :item_tag_relations
  has_many :tags,through: :item_tag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :delivery_fee

  with_options presence: true do
    
  end
end
