class AddDeletedAtToVendor < ActiveRecord::Migration[6.0]
  def change
    add_column :vendors, :deleted_at, :datetime
    add_index :vendors, :deleted_at
  end
end
