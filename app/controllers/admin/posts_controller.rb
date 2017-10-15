class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :load_model, only: %i[show edit update destroy]
  layout 'admin'
  def index
    @posts = Post.order(:public_on, 'created_at')
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to admin_posts_path, notice: 'Статья успешно создана', type: :success
    else
      flash[:error] = 'Не удалось создать статью'
      render :new
    end
  end

  def edit; end

  def update
    if @post.update post_params
      redirect_to admin_posts_path, notice: 'Статья успешно обновлена', type: :success
    else
      flash[:error] = 'Не удалось обновить статью'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path , notice: "Статья удалена", type: :success

  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :image, :all_tags)
    end

    def load_model
      @post = Post.friendly.find params[:id]
    end
end
