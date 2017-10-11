class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where(public_on: true).paginate(page: params[:page], per_page: 2).order('created_at')
  end

  def show
    @post = Post.friendly.find params[:id]
  end
end
