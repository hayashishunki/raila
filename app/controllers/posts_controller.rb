class PostsController < ApplicationController
  
  # require 'active_support/all'

  def index
    @posts = Post.all.order(created_at: :desc)
    if @post.blank?
      return @post
    else
      flash[:notice] = "値が存在しません管理者に問い合わせてください"
      redirect_to "/"
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.present?
        return @post
    else
      flash[:notice] = "データが存在しませんやり直してください"
      redirect_to "/posts/index"
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    begin
      @post.save!
      redirect_to posts_index_path, flash: { notice: '投稿を作成しました' }
    rescue => exception
      render "posts/new"
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.present?
      return @post
    else
      flash[:notice] = "データが存在しませんやり直してください"
      redirect_to "/posts/#{@post.id}/edit"
    end
  end

  def update
    @post = Post.find(params[:id])
    # @post.content = Post.update(post_params)
    begin
      @post.save!
      flash[:notice] = "投稿を編集しました"
      redirect_to "/posts/index"
    rescue => exception
      render "posts/edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to "/posts/index"
  end

  private
  def post_params
    params.permit(:content)
  end
end
