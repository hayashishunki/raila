# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :user_not_authorized
  before_action :ensure_correct_user, only: %i[edit update destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user_return
  rescue
    redirect_to posts_index_path, flash: { notice: t('.no_date') }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.save!
    redirect_to posts_index_path, flash: { notice: t('.success_create') }
  rescue StandardError
    render :new, flash: { notice: '投稿に失敗しましたやり直してください' }
  end

  def edit
    @post = Post.find_by(post_params_id)
    # TODO: : notice->errorに修正します。(viewも修正)
    render :edit, flash: { notice: t('.no_data') } if @post.blank?
  end

  def update
    @post = Post.find_by(post_params_id)
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
    params.permit(:content).merge(user_id: @current_user.id)
  end

  def post_params_id
    params.permit(:id)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    if @post.user_id != @current_user.id
      redirect_to posts_index_path, flash: { notice: '権限がありません' }
    end
  rescue
    redirect_to users_login_path, flash: { notice: '異常を検知しましたやり直してください' }
  end
end
