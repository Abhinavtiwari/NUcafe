class OrderMenusController < ApplicationController

  def index
    @order_menus = OrderMenu.all
  end

  def show
    @order_menu = OrderMenu.find_by(id: params[:id])
  end

  def new
  end

  def create
    @order_menu = OrderMenu.new
    @order_menu.item_id = params[:item_id]
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
    @order_menu.item_id = params[:item_id]
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
