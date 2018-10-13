class BbbController < ApplicationController
  def create
  	@product_new = Product.new(product_params)
	@product_new.save(product_params)
	redirect_to admin_user_path(current_admin)
  end
end