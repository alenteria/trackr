class CommentsController < ApplicationController
before_filter :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment])
    redirect_to @post
  end
end