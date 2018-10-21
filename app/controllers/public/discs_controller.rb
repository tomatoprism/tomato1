class Public::DiscsController < ApplicationController
  before_action :correct_user, only:[:update]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def update
  	@disc = Disc.find(params[:id])
  	@disc.update(disc_params)
  	redirect_to product_path(params[:product_id])
  end

  private
  def disc_params
    params.require(:disc).permit(:disc_name)
  end
  def product_params
        params.require(:product).permit(:title, :image, :price, :label, :stock, :release, :introduction, :artist_id, category_ids: [], discs_attributes: [:id, :disc_name, :done, :_destroy,tracks_attributes: [:id, :music, :list_num]])
    end
end

# binding.pry