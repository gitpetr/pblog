class Admin::PublicOnController < ApplicationController
  before_action :set_post

  def public_post
    @post.update public_on: true
    redirect_to admin_posts_path, notice: 'Статья опубликована', type: :success
  end

  def public_off_post
    @post.update public_on: false
    redirect_to admin_posts_path, notice: 'Статья снята с публикации', type: :success
  end

  private

  def set_post
    @post = Post.friendly.find params[:id]
  end
end
