# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    redirect_to posts_index_path, flash: { notice: t('.no_data') } if @post.blank?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.save!
    redirect_to '/posts/index', flash: { notice: t('.success_create') }
  rescue StandardError
    render :new
  end

  def edit
    @post = Post.find(params[:id])
    # TODO: : notice->errorに修正します。(viewも修正)
    render :edit, flash: { notice: t('.no_data') } if @post.blank?
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_index_path, flash: { notice: t('.success_edit')}
  rescue StandardError
    render :edit, flash: { notice: t('.no_edit')}
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to posts_index_path, flash: { notice: t('.success_delete')}
  rescue StandardError
    render :edit, flash: { notice: t('.no_delete')}
  end

  private

  def post_params
    params.permit(:content)
  end
end
