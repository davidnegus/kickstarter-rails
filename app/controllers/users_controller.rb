class UsersController < ApplicationController

  skip_before_action :check_logged_in, only: [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def show
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to projects_path
  end

  def destroy
  end

  def show
  end

  private

  def user_params 
    params.require(:user).permit(:email, :password)
  end
end
