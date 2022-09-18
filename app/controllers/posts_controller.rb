# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    redirect_to posts_index_path, flash: { notice: 'データが存在しませんやり直してください' } if @post.blank?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.save!
    redirect_to '/posts/index', flash: { notice: '投稿を作成しました' }
  rescue StandardError
    render 'posts/new'
  end

  def edit
    @post = Post.find(params[:id])
    # TODO:: notice->errorに修正します。(viewも修正)
    render :edit, flash: { notice: 'データが存在しませんやり直してください' } if @post.blank?
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash[:notice] = '投稿を編集しました'
    redirect_to '/posts/index'
  rescue
    flash[:notice] = '予期せぬエラーの為投稿を編集出来ませんでした'
    render :edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    flash[:notice] = '投稿を削除しました'
    redirect_to posts_index_path
  rescue
    flash[:error] = '投稿を削除出来ませんでした'
    render :edit
  end

  private

  def post_params
    params.permit(:content)
  end
end
