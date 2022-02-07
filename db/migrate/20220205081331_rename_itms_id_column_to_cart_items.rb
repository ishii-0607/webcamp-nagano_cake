class RenameItmsIdColumnToCartItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_items, :itms_id, :item_id
  end
end
