class ArtistsController < ApplicationController
  before_action :correct_user, only:[:new, :create, :edit, :update, :destroy]

  def correct_user
      unless admin_signed_in?
        redirect_to root_path
      end
  end

  def new
    @artist_new = Artist.new
  end

  def create
    @artist_new = Artist.new(artist_params)

    if @artist_new.save
       redirect_to artists_path, success: 'アーティストが追加されました'
    else
      @artists = Artist.all
      render "index"
    end

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

    if @artist_edit.update(artist_params)
       redirect_to artists_path, success: 'アーティストが編集されました'
    else
      render 'edit'
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy

    redirect_to new_artist_path, success: 'アーティストが削除されました'

  end

  def index
    @artist_new = Artist.new
    @artists = Artist.all

  end

  private
  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end
