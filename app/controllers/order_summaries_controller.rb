class OrderSummariesController < ApplicationController
  helper :all
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
    @order_summary = OrderSummary.where(:user_id=>current_user.id, :order_status=>"Current Order").first
    #@order_summary.user_id = 
    @order_summary.user_id = current_user.id
    @order_summary.order_status = "Submitted"
    @order_summary.order_date = Time.new
    @order_summary.order_total = params[:order_total]
    text_message = @order_summary.id.to_s + " successfully recieved at"+ Time.new.to_s
    if @order_summary.save
       # twilio_sid = ENV["twilio_sid"].to_s
       # twilio_token = ENV["twilio_token"].to_s
       # twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
       # message = twilio_client.account.sms.messages.create(
       #       :from => "+19196663079", 
       #      :to => "+19192719035", 
       #       :body => text_message
       #     )
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
