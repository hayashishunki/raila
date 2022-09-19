class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    redirect_to posts_index_path, flash: { notice: 'データが存在してませんやり直してください' } if @post.blank?
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.save!
    redirect_to posts_index_path, flash: { notice: '投稿を作成しました' } 
  rescue StandardError
    render :new
  end

  def edit
    @post = Post.find(params[:id])
    # TODO: : notice->errorに修正します。(viewも修正)
    render :edit, flash: { notice: '無効な値ですやり直してください' } if @post.blank?
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_index_path, flash: { notice: '投稿編集しました' }
  rescue StandardError
    render :edit, flash: { notice: '予期せぬエラーの為投稿編集出来ませんでした' }
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy!
    redirect_to posts_index_path, flash: { notice: '投稿を削除しました' }
  rescue StandardError
    render :edit, flash: { notice: '投稿を削除出来ませんでした' }
  end

  private

  def post_params
    params.permit(:content)
  end
end
