class ProductsController < ApplicationController
  before_action :find_product, only [:show, :edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:status] = :success
      flash[:result_text] = "Successfully created
      #{@product}"
      redirect_to product_path(@product)
    else
      flash[:status] = :failure
      flash[:result_text] = "Could not create #{@product}"
      flash[:messages] = @product.errors.messages
      render :new, status: :bad_request
    end
  end

  def show

  end

  def edit

  end

  def update
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
