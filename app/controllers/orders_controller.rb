class OrdersController < ApplicationController

  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.find_by(id: session[:order_id])
    
    if session[:merchant]
      merchant_id = session[:merchant]['id']
      @orders = Merchant.find(merchant_id).orders
    end

  end

  def new
    @order = Order.new
  end
  # add @order_items
  def show
    if @order.nil?
      head :not_found
    else @order_items = current_order.order_items
    end

  end

  def create



    # #TODO: translate into strong params
    # @order_item = OrderItem.new(product_id: params[:product_id].to_i, quantity: params[:quantity].to_i, order_id: params[:order_id])
    # # order_id = OrderItem.add_order_item_to_order(@order_item)
    # # @order_item.order_id = order_id
    #
    # # TODO: add if/else or model method to check against + edit product inventory
    #
    # result = @order_item.save
    #
    # if result
    #   flash[:status] = :success
    #   flash[:result_text] = "Successfully created
    #   order item"
    # else
    #   flash[:status] = :failure
    #   flash[:result_text] = "DID NOT create order item #{order_id}"
    #   flash[:messages] = @order_item.errors.messages
    # end
    # redirect_back(fallback_location: root_path)


    # if session[:order_id] ==
    #   @order = Order.new #(params)
    #   @order_category = @order.category
    #   if @order.save
    #     flash[:status] = :success
    #     # flash[:result_text] = "Successfully created order"
    #     # redirect_to
    #   else
    #     flash[:status] = :failure
    #     # flash[:result_text] = "Could not create order"
    #     # flash[:messages] = @order.errors.messages
    #     # render :new, status: :bad_request
    #   end
=======
    if sessions[:order_id] ==
    @order = Order.new #(params)
    @order_category = @order.category
      if @order.save
        flash[:status] = :success
        # flash[:result_text] = "Successfully created order"
        # redirect_to
      else
        flash[:status] = :failure
        # flash[:result_text] = "Could not create order"
        # flash[:messages] = @order.errors.messages
        # render :new, status: :bad_request
      end
    end
>>>>>>> 5c1da7aa571fbd073d0969b611afe22a8e4d8ffb
  end

  def edit
    if @order.nil?
      head :not_found
    end
  end

  def update
    if @order.nil?
      head :not_found
    end
  end
<<<<<<< HEAD
=======

>>>>>>> 5c1da7aa571fbd073d0969b611afe22a8e4d8ffb
  def destroy
    if @order.nil?
      head :not_found
    end
    #if @order.destroy
    #redirect_to orders_path
    #else
    #render :show
    #end
  end

  private



  def find_order
    @order = Order.find_by(id: params[:id])
  end

<<<<<<< HEAD

=======
>>>>>>> 5c1da7aa571fbd073d0969b611afe22a8e4d8ffb
end
