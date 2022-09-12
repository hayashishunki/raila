class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    # [余裕あれば修正]
    # idでPost.find(params[:id])にしない理由はありますか？
    # そもそも詳細画面で@postがnilになるケースはエラー扱いなので、フロントに渡す前にここでエラー処理した方がいいです。
    # 他の部分も同様です。
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
  # [やっておいた方が有利]
  # データ保存の際はストロングパラメータを使った方がいいです。
  # 参考サイト https://qiita.com/ozackiee/items/f100fd51f4839b3fdca8
    @post = Post.new(content: params[:content])
    # 一つ余計なスペースがあるので削除

    # ""と''の違い
    # '' => 文字列のみで構成された際に使用 (例) 'テストです'
    # "" => 変数と組み合わせる際に使用 (例) "test = 'テスト'  #{test}です"

    # [やっておいた方が有利]
    # @post.saveより@post.save!を使ってエラーを明確した方が良いです。
    # save!に関する参考サイト https://techacademy.jp/magazine/22082
     if @post.save
      # [余裕あれば修正]
      # 以下の書き方だと1行で書けたりします
      # redirect_to posts_path, flash: { notice: '投稿を作成しました' }
      flash[:notice] = "投稿を作成しました"
      redirect_to "/posts/index"
     else
      render "posts/new"
     end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to "/posts/index"
    else
      render "posts/edit"
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to "/posts/index"
  end
end
