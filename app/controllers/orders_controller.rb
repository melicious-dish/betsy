class OrdersController < ApplicationController

  before_action :find_order, only: [:show, :edit, :update, :destroy]

  # IDEA: INSTEAD OF ORDER_ITEMS PATH ON PRODUCT SHOW PAGE, MAKE IT A PATH TO CREATE OR UPDATE THE ORDER -- AND HAVE A METHOD WHERE WE CAN ADD IN EACH ORDER_ITEM (ORDER_ITEMS NEED THE ID OF BOTH AN ORDER AND A PRODUCT)
  def index
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

end
