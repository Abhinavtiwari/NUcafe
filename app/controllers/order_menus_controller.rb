class OrderMenusController < ApplicationController
helper :all

  def index
    @order_menus = OrderMenu.all
    @time = Time.new
    @time = @time.strftime("%A").to_s.downcase
    @item_menus =  ItemMenu.where(@time=>true)
    # if no current order exists for the user then create a new one.
    orderexists = OrderSummary.where(:user_id=>current_user.id, :order_status=>"Current Order")
    if(orderexists.count>0) # Order exists
      @order_summary = orderexists.first
      @inprogress_item_menus = OrderMenu.where(:order_id=>@order_summary.id)
    else  # Order doesn't exist
      @order_summary = OrderSummary.new 
      @order_summary.order_status = "Current Order"
      @order_summary.user_id  = current_user.id
      @order_summary.save
      @inprogress_item_menus = OrderMenu.where(:order_id=>@order_summary.id)
    end
  end


  def show
    @order_menu = OrderMenu.find_by(id: params[:id])
  end

  def new
    # if no current order exists for the user then create a new one.
    orderexists = OrderSummary.where(:user_id=>current_user.id, :order_status=>"Current Order")
    if(orderexists.count>0) # Order exists
      @order_summary = orderexists.first
      @inprogress_item_menus = OrderMenu.where(:order_id=>@order_summary.id)
    else  # Order doesn't exist
      @order_summary = OrderSummary.new 
      @order_summary.order_status = "Current Order"
      @order_summary.user_id  = current_user.id
      @order_summary.save
      @inprogress_item_menus = OrderMenu.where(:order_id=>@order_summary.id)
    end
  
    
    itemexists = OrderMenu.where(:order_id => @order_summary.id, :item_menu_id => params[:item_menu_id]  )
    if(itemexists.count==0) #item doesn't exist in the current order
      @order_menu = OrderMenu.new
      @order_menu.item_menu_id = params[:item_menu_id]
      @order_menu.item_quantity = params[:item_quantity]
      @order_menu.order_id = @order_summary.id
        if @order_menu.save
          redirect_to order_menus_url, notice: "Item added successfully."
        else
          render 'new'
        end
    else #item exists, update quantity
      @order_menu = OrderMenu.where(:order_id => @order_summary.id, :item_menu_id => params[:item_menu_id])
      @order_menu.first.item_quantity = @order_menu.first.item_quantity + params[:item_quantity].to_i
      @order_menu.first.save
      redirect_to order_menus_url, notice: "Item added successfully."
    end

  end

  def create
    
  end

  def edit
    @order_menu = OrderMenu.find_by(id: params[:id])
  end

  def update
    # No update functionality
  end

  def destroy
    @order_summary = OrderSummary.where(:user_id=>current_user.id, :order_status=>"Current Order").first
    @order_menu = OrderMenu.find_by(:item_menu_id => params[:id], :order_id => @order_summary.id)
    @order_menu.destroy
    redirect_to order_menus_url, notice: "Order Item Removed."
  end
end
