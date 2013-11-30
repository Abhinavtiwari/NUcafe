class OrderMenu < ActiveRecord::Base
belongs_to :order_summary
belongs_to :item_menu

validates :item_quantity, :presence => true, :numericality => {greater_than: 0}
end
