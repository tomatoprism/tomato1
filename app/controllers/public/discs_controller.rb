class Public::DiscsController < ApplicationController
  def edit
  end

  def update
  	@disc = Disc.find(params[:id])
  	@disc.update(disc_params)
  	redirect_to product_path(params[:produc_id])
  end

  def destroy
  end

  def create
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