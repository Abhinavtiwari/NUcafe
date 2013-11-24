class CreateOrderSummaries < ActiveRecord::Migration
  def change
    create_table :order_summaries do |t|
      t.integer :user_id
      t.string :order_status
      t.date :order_date
      t.float :order_total
    end
  end
end
