class UsersController < ApplicationController
  layout 'welcome', only: [:welcome]

  def welcome
  end

  def dashboard
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end
end
