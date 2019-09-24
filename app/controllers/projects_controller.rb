class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
    @user = User.find(session[:user_id])
  end

  def create
    Project.create(project_params)
    puts Project.all.count
    redirect_to projects_path
  end

  def destroy
    Project.delete(params[:id])
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
    
  end

  private

  def project_params
    params.require(:project).permit(:title, :goal)
  end

end
