class WallsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.order('created_at desc')
    @comments = Comment.where(params[:post_id])
  end

end
