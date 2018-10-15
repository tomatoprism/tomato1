class Public::DiscsController < ApplicationController
  def edit
  end

  def update
  	@disc = Disc.find(params[:id])
  	@disc.update(disc_params)
  	redirect_to product_path
  end

  def destroy
  end

  def create
  end

  private
  def disc_params
    params.require(:disc).permit(:disc_name, :product_id)
  end
end