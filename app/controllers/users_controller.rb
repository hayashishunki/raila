class UsersController < ApplicationController
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
    @user = User.new(name: params[:name], email: params[:email], image_name: 'icon1.png')
    @user.save!
    redirect_to "/users/#{@user.id}", flash: { notice: t('.success_user') }
  rescue StandardError
    render :new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    @user.save!
    redirect_to users_index_path, flash: { notice: t('.success_edit') }
  rescue StandardError
    render :edit
  end
end
