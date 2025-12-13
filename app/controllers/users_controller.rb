class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def show;end

  def edit;end

  def my_snacks
    @snacks = current_user.snacks
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar) # avatarはアイコン画像です。
  end
end
