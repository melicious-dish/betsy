class OrdersController < ApplicationController

before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @order = Order.new
  end

  def show
    if @order.nil?
      head :not_found
    end
  end

  def create
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

  def edit
    if @order.nil?
      head :not_found
    end
  end

  def update
    if @order.nil?
      head :not_found
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

  def order_params
    return
    end

    def find_order
      @order = Order.find_by(id: params[:id])
    end
  end
