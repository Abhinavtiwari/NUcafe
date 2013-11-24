class CreateItemMenus < ActiveRecord::Migration
  def change
    create_table :item_menus do |t|
      t.string :item_name
      t.string :item_category
      t.string :item_picture
      t.string :item_description
      t.float :item_price
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
    end
  end
end
