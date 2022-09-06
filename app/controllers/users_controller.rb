class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find_by(id: params[:id])
  end

  def new
  end

  def create
    @users = User.new(name: params[:name], email: params[:email])
    @users.save
    redirect_to "/users/#{@users.id}"
  end

end
