class ArtistsController < ApplicationController
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def new
    @artist_new = Artist.new
    @artist = Artist.all
  end

  def create
    @artist_new = Artist.new(artist_params)
    @artist_new.save(artist_params)
    redirect_to new_artist_path, success: 'アーティストが追加されました'
  end

  def show
    @artist = Artist.find(params[:id])
    @products = @artist.products.page(params[:page]).reverse_order
    @categories = Category.all
    @artists = Artist.all
  end
  def edit
    @artist_edit = Artist.find(params[:id])
  end

  def update
    @artist_edit = Artist.find(params[:id])
    @artist_edit.update(artist_params)
    redirect_to new_artist_path, success: 'アーティストが編集されました'
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to new_artist_path, success: 'アーティストが削除されました'
  end

  private
  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end
