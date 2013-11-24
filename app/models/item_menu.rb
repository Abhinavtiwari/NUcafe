class ItemMenu < ActiveRecord::Base
	has_many :order_menus
	mount_uploader :item_picture, PictureUploader 
end
