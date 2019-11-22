class UsersController < ApplicationController

  def welcome; end

  def dashboard
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
