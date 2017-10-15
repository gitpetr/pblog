class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
  def show
    @tag = Tag.find_by(name: params[:id])
    @posts = @tag.posts
  end
end
