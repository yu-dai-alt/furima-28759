class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :image
      t.integer :price
      t.integer :area
      t.integer :category
      t.integer :item_status
      t.integer :delivery_fee
      t.integer :shipping_day

      t.timestamps
    end
  end
end
