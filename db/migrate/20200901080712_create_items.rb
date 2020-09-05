class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,            default: "",  null: false
      t.text    :info,            default: "",  null: false
      t.text    :image,           default: "",  null: false
      t.integer :price,           default: "",  null: false
      t.integer :prefecture_id,   default: "",  null: false
      t.integer :category_id,     default: "",  null: false
      t.integer :item_status_id,  default: "",  null: false
      t.integer :delivery_fee_id, default: "",  null: false
      t.integer :shipping_day_id, default: "",  null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
