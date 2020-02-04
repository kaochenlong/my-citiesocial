class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :sku, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
