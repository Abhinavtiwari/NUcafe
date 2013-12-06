class AboutController < ApplicationController


  def about
   	@order_menus = OrderMenu.all
    @time = Time.new
    @time = @time.strftime("%A").to_s.downcase
    @item_menus =  ItemMenu.where(@time=>true)
  end

end