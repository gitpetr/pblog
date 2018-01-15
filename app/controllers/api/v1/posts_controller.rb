module Api 
  module V1 
    class PostsController < Api::ApplicationController
      before_action :doorkeeper_authorize!
      
      def index
        @posts = Post.order('created_at DESC')
         
        render json: @posts
      end

      def show
        @post = Post.find(params[:id])
        render json: @post
      end
    end
  end
end
