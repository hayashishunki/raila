class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    if @posts.present?
      return @post
    else
      flash[:notice] = '値が存在しません管理者に問い合わせてください'
      redirect_to '/'
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.blank?
      redirect_to posts_path, flash: { notice: 'データが存在しませんやり直してください' }
    end
  end

  def new
    if @post = Post.new
      return @post
    else
      render 'posts/new'
    end
  end

  def create
    @post = Post.create(post_params)
    begin
      @post.save!
      redirect_to '/posts/index', flash: { notice: '投稿を作成しました' }
    rescue => exception
      render 'posts/new', flash: { notice: '投稿に失敗しましたやり直してください' }
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.present?
      return @post
    else
      flash[:notice] = 'データが存在しませんやり直してください'
      render :edit
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = '投稿を編集しました'
      redirect_to '/posts/index'
    else
      render 'posts/edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = '投稿を削除しました'
    else
      flash[:notice] = '投稿を削除出来ませんでした'
    end
    redirect_to '/posts/index'
  end

  private
    def post_params
      params.permit(:content)
    end
end
