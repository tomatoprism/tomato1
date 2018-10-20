class Public::ReviewsController < ApplicationController
  def create
  	product = Product.find(params[:product_id])
    review = current_user.reviews.new(review_params)
    review.product_id = product.id
    review.save
    redirect_to product_path(product.id)
  end

  def destroy
    product = Product.find(params[:product_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to product_path(product.id)
  end


private
	def review_params
		params.require(:review).permit(:user_id, :product_id, :text)
	end

end
