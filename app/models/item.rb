class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :delivery_fee

  with_options presence: true do
    validates :name,            length: { maximum: 40, too_long: "最大%{count}文字まで使えます" }
    validates :info,            length: { maximum: 1000, too_long: "最大%{count}文字まで使えます" }
    validates :category_id,     numericality: { other_than: 1 }
    validates :item_status_id,  numericality: { other_than: 1 }
    validates :shipping_day_id, numericality: { other_than: 1 }
    validates :prefecture_id,   numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :price,           format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
    validates :price,           numericality: { only_integer: true }
    validates :price,           numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
