class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order('created_at')
  end

  def show
    @post = Post.friendly.find params[:id]
  end
end