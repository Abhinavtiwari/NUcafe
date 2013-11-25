class OrderSummary < ActiveRecord::Base
belongs_to :user
has_many :order_menus
has_many :item_menus, :through => :order_menus

end
