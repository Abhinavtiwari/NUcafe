class OrderSummariesController < ApplicationController
  
  def index
    #@order_summaries = OrderSummary.all
    #we can check for admin and assign to all or one
   @order_summaries = current_user.order_summarys #user can only see his own orders
  end

  def show
    @order_summary = OrderSummary.find_by(id: params[:id])
  end

  def new
  end

  def create
    @order_summary = OrderSummary.new
    #@order_summary.user_id = 
    @order_summary.user_id = current_user.id
    @order_summary.order_status = "Submitted"
    @order_summary.order_date = Time.new
    @order_summary.order_total = params[:order_total]
    
    if @order_summary.save
       Rails.cache.write("order_id", nil)
      redirect_to order_summaries_url, notice: "Order summary created successfully."
    else
      render 'new'
    end
  end

  def edit
    @order_summary = OrderSummary.find_by(id: params[:id])
  end

  def update
    @order_summary = OrderSummary.find_by(id: params[:id])
    @order_summary.user_id = params[:user_id]
    @order_summary.order_status = params[:order_status]
    @order_summary.order_date = params[:order_date]
    @order_summary.order_total = params[:order_total]

    if @order_summary.save
      redirect_to order_summaries_url, notice: "Order summary updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @order_summary = OrderSummary.find_by(id: params[:id])
    @order_summary.destroy

    redirect_to order_summaries_url, notice: "Order summary deleted."
  end
end
