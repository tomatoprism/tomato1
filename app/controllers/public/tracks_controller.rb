class Public::TracksController < ApplicationController
  def create
  end

  def update
  	@track = Track.find(params[:id])
  	@track.update(track_params)
  	redirect_to product_path(params[:product_id])
  end

  def destroy
  end

  private
  def track_params
    params.require(:track).permit(:music, :list_num, :disc_id)
  end
  def product_params
        params.require(:product).permit(:title, :image, :price, :label, :stock, :release, :introduction, :artist_id, category_ids: [], discs_attributes: [:id, :disc_name, :done, :_destroy,tracks_attributes: [:id, :music, :list_num]])
    end
end