class ItemTag

  include ActiveModel::Model
  attr_accessor :name, :info, :images, :price, :prefecture_id, :category_id, :item_status_id, :delivery_fee_id, :shipping_day_id, :user_id, :word

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
    validates :word
  end

  def save
    item = Item.create(name: name, info: info, category_id: category_id, item_status_id: item_status_id, shipping_day_id: shipping_day_id, prefecture_id: prefecture_id, delivery_fee_id: delivery_fee_id, price: price, images: images)
    tag = Tag.where(word: word).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

end