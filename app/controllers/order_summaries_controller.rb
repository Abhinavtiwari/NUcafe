require 'twilio-ruby'

class OrderSummariesController < ApplicationController
  helper :all
  def index
    if current_user.try(:admin?)
    @order_summaries = OrderSummary.order('order_date DESC')
   
    #@order_summaries = OrderSummary.order(params[:sort]) if params[:sort]
    @order_summaries = @order_summaries.all

    #@order_summaries = OrderSummary.all
  else
    #we can check for admin and assign to all or one
   @order_summaries = current_user.order_summarys.order('order_date DESC') #user can only see his own orders
 end
  end

  def show
    @order_summary = OrderSummary.find_by(id: params[:id])
  end

  def new
  end

  def create
    @order_summary = OrderSummary.where(:user_id=>current_user.id, :order_status=>"Current Order").first
    #@order_summary.user_id = 
    @order_summary.user_id = current_user.id
    @order_summary.order_status = "Submitted"
    @order_summary.order_date = Time.new
    @order_summary.order_total = params[:order_total]
    text_message = "Order "+@order_summary.id.to_s + " successfully Submitted at "+ Time.new.to_s
    @error = false
    if @order_summary.save
       phone_number = current_user.phone.to_s
       begin
        text_message = send_text_message(phone_number, text_message) #Hard coded for now)
        # Text message success
       rescue
        # Text message failure
        text_message = text_message + " Unable to send text message. Please contact Customer Support."
       end
       redirect_to order_summaries_url, notice: text_message
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
    text_message = "Order "+@order_summary.id.to_s + " has been "+ @order_summary.order_status.to_s+" at "+Time.new.to_s
    @error = false
    if @order_summary.save
      
      phone_number = current_user.phone.to_s
      begin
        text_message = send_text_message(phone_number, text_message) #Hard coded for now)
        # Text message success
       rescue
        # Text message failure
        text_message = text_message + " Unable to send text message. Please contact Customer Support."
       end
       redirect_to order_summaries_url, notice: text_message
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
