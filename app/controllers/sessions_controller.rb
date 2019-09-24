class SessionsController < ApplicationController

  skip_before_action :check_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by({email: params["session"]["email"]})
    if user && user.authenticate(params["session"]["password"])
      session[:user_id] = user.id
      redirect_to projects_url
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


  private 

  def email_params
    params.require(:session).permit(:email, :password)
  end
end
