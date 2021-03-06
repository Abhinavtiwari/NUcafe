class ItemMenusController < ApplicationController
  before_action(:authorize_user, :only => [:show, :edit, :update, :destroy, :new])
  helper :all
  
  def authorize_user
   unless current_user.try(:admin?)
    redirect_to root_url, notice: "You need admin rights to access this section"
    end
  end

  def index
    @item_menus = ItemMenu.all
    @item_menus =  @item_menus.order('item_category ASC')

  end

  def show
    @item_menu = ItemMenu.find_by(id: params[:id])
  end

  def new
  end

  def create
    @item_menu = ItemMenu.new
    @item_menu.item_name = params[:item_name]
    @item_menu.item_category = params[:item_category]
    @item_menu.item_picture = params[:item_picture]
    @item_menu.item_description = params[:item_description]
    @item_menu.item_price = params[:item_price]
    @item_menu.monday = params[:monday]
    @item_menu.tuesday = params[:tuesday]
    @item_menu.wednesday = params[:wednesday]
    @item_menu.thursday = params[:thursday]
    @item_menu.friday = params[:friday]
    @item_menu.saturday = params[:saturday]
    @item_menu.sunday = params[:sunday]

    if @item_menu.save
      redirect_to item_menus_url, notice: "Item menu created successfully."
    else
      render 'new'
    end
  end

  def edit
    @item_menu = ItemMenu.find_by(id: params[:id])
  end

  def update
    @item_menu = ItemMenu.find_by(id: params[:id])
    @item_menu.item_name = params[:item_name]
    @item_menu.item_category = params[:item_category]
    @item_menu.item_picture = params[:item_picture]
    @item_menu.item_description = params[:item_description]
    @item_menu.item_price = params[:item_price]
    @item_menu.monday = params[:monday]
    @item_menu.tuesday = params[:tuesday]
    @item_menu.wednesday = params[:wednesday]
    @item_menu.thursday = params[:thursday]
    @item_menu.friday = params[:friday]
    @item_menu.saturday = params[:saturday]
    @item_menu.sunday = params[:sunday]

    if @item_menu.save
      redirect_to item_menus_url, notice: "Item menu updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @item_menu = ItemMenu.find_by(id: params[:id])
    @item_menu.destroy

    redirect_to item_menus_url, notice: "Item menu deleted."
  end
end
