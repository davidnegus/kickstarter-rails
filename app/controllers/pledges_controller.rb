class PledgesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @project = Project.find(params[:project_id])
    payload = pledge_params
    payload[:user_id] = session[:user_id]
    @project.pledges.create(payload)
    redirect_to project_path(@project)
  end

  def destroy
  end

  def show
  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end


end
