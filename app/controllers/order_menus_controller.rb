class OrderMenusController < ApplicationController


  def index
    @order_menus = OrderMenu.all
    @time = Time.new
    @time = @time.strftime("%A").to_s.downcase
    @item_menus =  ItemMenu.where(@time=>true)
    if(Rails.cache.read("order_id")==nil)
      @order_summary = OrderSummary.new 
      @order_summary.save
      Rails.cache.write("order_id", @order_summary.id)
      
    else
      @order_summary = OrderSummary.find_by(:id => Rails.cache.read("order_id"))
      @inprogress_item_menus = OrderMenu.where(:order_id => Rails.cache.read("order_id"))
    end
  end


  def show
    @order_menu = OrderMenu.find_by(id: params[:id])
  end

  def new
    if(Rails.cache.read("order_id")==nil)
      @order_summary = OrderSummary.new 
      Rails.cache.write("order_id", @order_summary.id)
      @order_summary.save
    else
      @order_summary = OrderSummary.find_by(:id=> Rails.cache.read("order_id"))
    end

    @order_menu = OrderMenu.new
    @order_menu.item_menu_id = params[:item_menu_id]
    @order_menu.item_quantity = params[:item_quantity]
    @order_menu.order_id = @order_summary.id
    
    if @order_menu.save
      redirect_to order_menus_url, notice: "Order menu created successfully."
    else
      render 'new'
    end
  end

  def create
    @order_menu = OrderMenu.new
    @order_menu.item_menu_id = params[:item_menu_id]
    @order_menu.item_quantity = params[:item_quantity]
    @order_menu.order_id = params[:order_id]

    if @order_menu.save
      redirect_to order_menus_url, notice: "Order menu created successfully."
    else
      render 'new'
    end
  end

  def edit
    @order_menu = OrderMenu.find_by(id: params[:id])
  end

  def update
    @order_menu = OrderMenu.find_by(id: params[:id])
    @order_menu.item_menu_id = params[:item_menu_id]
    @order_menu.item_quantity = params[:item_quantity]
    @order_menu.order_id = params[:order_id]

    if @order_menu.save
      redirect_to order_menus_url, notice: "Order menu updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @order_menu = OrderMenu.find_by(id: params[:id])
    @order_menu.destroy

    redirect_to order_menus_url, notice: "Order menu deleted."
  end
end
