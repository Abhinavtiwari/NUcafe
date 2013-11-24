class RemoveItemIdFromOrderMenu < ActiveRecord::Migration
  def change
    remove_column :order_menus, :item_id, :integer
  end
end
