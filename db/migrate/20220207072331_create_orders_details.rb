class CreateOrdersDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_details do |t|

      t.integer :item_id
      t.integer :orde_id
      t.integer :included_price
      t.integer :amount

      t.timestamps
    end
  end
end
