class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @order_item = current_order.order_items.new
  end

  def create
    if @login_user
      # merchant_id = @login_user.id
      # @login_user = @merchant.product.id
      @product = Product.new(product_params)
      @product.merchant_id = @login_user.id
      if @product.save
        flash[:status] = :success
        flash[:result_text] = "Successfully created
        #{@product}"
        redirect_to product_path(@product)
        # debugger
      else
        render :new
      end
    end
    if !@login_user
      flash[:status] = :failure
      flash[:result_text] = "Could not create #{@product}"
      flash[:messages] = @product.errors.messages
      redirect_to root_path
    end
    # debugger
  end

  def show;

  end

  def edit
    @product = Product.new()
  end

  def update
    if !@login_user
      flash[:status] = :failure
      flash[:result_text] = "You must log in to update #{@product}"
      flash[:messages] = @product.errors.messages
      redirect_back fallback_location: root_path
    end

    if !find_product
      flash[:status] = :failure
      flash[:result_text] = "Unable to find #{@product}"
      flash[:messages] = @product.errors.messages
      redirect_back fallback_location: root_path
    end

    @product = find_product()
    result = @product.update(product_params)

    if result
      flash[:status] = :success
      flash[:result_text] = "Successfully updated
      #{@product}"
      redirect_to product_path(@product)
    else
      flash[:status] = :failure
      flash[:result_text] = "Could not update #{@product}"
      flash[:messages] = @product.errors.messages
      render :edit, status: :bad_request
    end
  end

  def add_to_order
    @order_item = OrderItem.new
    #(order_id: @current_cart.id, product_id: product.id, quantity: params[:order_items][:inventory], status: 'pending')
    if @order_item.save
      # product.inventory -= params[:order_products][:inventory].to_i
      # product.save
      flash[:status] = :success
      flash[:result_text] = "Successfully added product to cart"
      redirect_to product_path(@product.id)
    else
      flash[:status] = :failure
      flash[:result_text] = "Failed to add to cart"
      # render :show
    end
  end
  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :photo_url, :status, :inventory)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    head :not_found unless @product
  end
end
