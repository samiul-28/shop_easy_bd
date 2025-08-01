class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product
    before_action :set_review, only: [:edit, :update, :destroy]
  
    def create
      @review = @product.reviews.build(review_params)
      @review.user = current_user
      authorize @review
  
      if @review.save
        redirect_to @product, notice: 'Review submitted successfully!'
      else
        redirect_to @product, alert: 'Failed to submit review.'
      end
    end
  
    def edit
      authorize @review
    end
  
    def update
      authorize @review
      if @review.update(review_params)
        redirect_to @product, notice: 'Review updated successfully!'
      else
        render :edit, alert: 'Failed to update review.'
      end
    end
  
    def destroy
      authorize @review
      @review.destroy
      redirect_to @product, notice: 'Review deleted successfully!'
    end
  
    private
  
    def set_product
      @product = Product.find(params[:product_id])
    end
  
    def set_review
      @review = @product.reviews.find(params[:id])
    end
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
  