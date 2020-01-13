class CreateSkus < ActiveRecord::Migration[6.0]
  def change
    create_table :skus do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :spec
      t.integer :quantity
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :skus, :deleted_at
  end
end
