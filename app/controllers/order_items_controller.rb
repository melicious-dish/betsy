class OrderItemsController < ApplicationController
 # the first time the user adds an order_item to his cart, the new order is persisted to the database. From there on, the order's state is saved every time an order_item is added.
  def create
   @order = current_order
   @order_item = @order.order_items.new(order_item_params)
   @order.save
   session[:order_id] = @order.id
   flash[:result_text] = "Successfully created order"
 end

 def update
   @order = current_order
   @order_item = @order.order_items.find(params[:id])
   @order_item.update_attributes(order_item_params)
   @order_items = @order.order_items
 end

 def destroy
   @order = current_order
   @order_item = @order.order_items.find(params[:id])
   @order_item.destroy
   @order_items = @order.order_items
 end

 private

 def order_item_params

 end
 
end
