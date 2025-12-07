class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def edit;end

  def my_snacks
    @snacks = current_user.snacks
  end

end
