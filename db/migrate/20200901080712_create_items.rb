class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,            default: "",  null: false
      t.text    :info,                          null: false
      t.text    :image,                         null: false
      t.integer :price,                         null: false
      t.integer :prefecture_id,                 null: false
      t.integer :category_id,                   null: false
      t.integer :item_status_id,                null: false
      t.integer :delivery_fee_id,               null: false
      t.integer :shipping_day_id,               null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
