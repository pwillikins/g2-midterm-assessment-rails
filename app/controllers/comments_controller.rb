class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    post_id = params[:post_id]
    body = params[:comment][:comment]
    user_id = current_user.id
    @comment = Comment.new(post_id: post_id, user_id: user_id, comment: body)
    if @comment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

end