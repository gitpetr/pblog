class TagsController < ApplicationController
  before_action :authenticate_user!
  def show
    @tag = Tag.find_by(name: params[:id])
    @posts = @tag.posts.where(public_on: true).order('created_at')
  end
end
