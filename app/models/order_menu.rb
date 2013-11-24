class OrderMenu < ActiveRecord::Base
belongs_to :order_summary
belongs_to :item_menu

end
