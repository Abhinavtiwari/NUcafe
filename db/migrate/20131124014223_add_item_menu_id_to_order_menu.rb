class AddItemMenuIdToOrderMenu < ActiveRecord::Migration
  def change
    add_column :order_menus, :item_menu_id, :integer
  end
end
