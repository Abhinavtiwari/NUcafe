class CreateOrderMenus < ActiveRecord::Migration
  def change
    create_table :order_menus do |t|
      t.integer :item_id
      t.integer :item_quantity
      t.integer :order_id
    end
  end
end
