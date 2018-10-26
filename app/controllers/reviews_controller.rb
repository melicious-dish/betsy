class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update]

  def new
    @review = Review.new
    @review.product = Product.find(params[:product_id])
  end

  def create
      @review = Review.new(review_params)
      @review.product = Product.find(params[:product_id])

      if !@login_user
        if @review.save
          flash[:status] = :success
          flash[:result_text] = "Successfully created review."
          redirect_to product_path(@review.product)
        else
          render :new
        end
      end

      if @login_user
        flash[:status] = :failure
        flash[:result_text] = "You cannot review your own product."
        # flash[:messages] = @product.errors.messages
        redirect_to product_path(@review.product)
      end

  end



  private

  def review_params
      params.require(:review).permit(:star_rating, :text, :product_id)
  end

  def find_review
    @review = Review.find_by(id: params[:id])
    head :not_found unless @review
  end
end
