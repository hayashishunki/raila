class UsersController < ApplicationController
  before_action :user_not_authorized, only: %i[index edit show update destroy]
  before_action :limit_login_user, only: %i[new create login_form login]
  before_action :correct_user, only: %i[edit update]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    redirect_to users_index_path, flash: { notice: t('.no_data') } if @user.blank?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params.merge(image_name: 'icon1.png' ))
    @user.save!
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}", flash: { notice: '新規ユーザーを登録しました' }
  rescue StandardError
    render :new, flash: { notice: 'エラー!!ユーザー登録できませんでした' }
  end

  def edit
    @user = User.find_by(user_params_id)
    render :edit, flash: { notice: 'エラーが発生やり直してください' } if @user.blank?
  end

  def update
    @user = User.find_by(user_params_id)
    @user.update(user_params)
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    @user.save!
    redirect_to users_index_path, flash: { notice: t('.success_edit') }
  rescue StandardError
    render :edit, flash: { notice: 'エラー!!投稿を編集出来ませんでした' }
  end

  def login_form
  end

  def login
    @user = User.find_by(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to posts_index_path, flash: { notice: 'ログインしました' }
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render :login_form
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, flash: { notice: 'ログアウトしました' }
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def user_params_id
    params.permit(:id)
  end

  def correct_user
    if @current_user.id != params[:id].to_i
      redirect_to '/posts/index', flash: { notice: '権限がありません' }
    end
  end

end
