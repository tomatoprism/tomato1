class PostsController < ApplicationController

  def new
  	@post = Post.new
  end

  def create
  	post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
       redirect_to user_path(current_user.id)
    else
       render :new
    end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
    post.update(post_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
  end

  private
    def post_params
        params.require(:post).permit(:post_address, :post_code, :post_code, :postage_id)
    end
end
