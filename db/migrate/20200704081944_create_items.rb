class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :image, null: false
      t.string :introduction, null: false
      t.integer :price, null: false
      t.integer :sales_commission, null: false
      t.integer :sales_profit, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :postage_pay_id, null: false
      t.integer :shipping_area_id, null: false
      t.integer :days_until_shipping_id, null: false
      t.timestamps
    end
  end
end
