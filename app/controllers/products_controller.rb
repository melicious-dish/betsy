class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update]

  def index
    if params[:merchant_id]
      merchant = Merchant.find_by(id: params[:merchant_id])
      @products = merchant.products

    elsif params[:category_id]
      category = Category.find_by(id: params[:category_id])
      @products = category.products
    else
      @products = Product.all
    end
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
        #{@product.name}"
        redirect_to product_path(@product)
        # debugger
      else
        render :new
      end
    end


    if !@login_user
      flash[:status] = :failure
      flash[:result_text] = "Could not create #{@product}"
      # flash[:messages] = @product.errors.messages
      redirect_to root_path
    end
    # debugger
  end

  def show;

  end

  def edit;

  end

  def update
    if @login_user

      if @product.update(product_params)
        flash[:status] = :success
        flash[:result_text] = "Successfully updated product #{@product.name}"
        redirect_to product_path(@product.id)
      else
        flash[:status] = :failure
        flash[:result_text] = "Failed to update"
        render :edit, status: :bad_request
      end
    else
      redirect_back fallback_location: root_path, status: :bad_request

    end
  end

  def destroy
    if @login_user

      product = Product.find_by(id: params[:id])

      product.destroy

      flash[:status] = :success
      flash[:result_text] = "Successfully deleted product #{product.name}"
      redirect_to merchant_path(@login_user)
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
      params.require(:product).permit(:name, :price, :description, :photo_url, :status, :inventory, category_ids: [])
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    head :not_found unless @product
  end
end
