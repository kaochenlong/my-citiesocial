class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.datetime :deleted_at
      t.integer :position

      t.timestamps
    end

    add_index :categories, :deleted_at
  end
end
