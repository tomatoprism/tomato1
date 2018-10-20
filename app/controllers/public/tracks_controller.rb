class Public::TracksController < ApplicationController
  def create
  end

  def update
  	@track = Track.find(params[:id])
  	@track.update(track_params)
  	redirect_to root_path
  end

  def destroy
  end

  private
  def track_params
    params.require(:track).permit(:music, :list_num, :disc_id)
  end
end