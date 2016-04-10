class ProjectsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :project_owner, only: [:edit, :update, :destroy]
  require 'date'

  def readyfor
  end

  def index
    @projects = Project.order(created_at: :desc)
    #検索
    @q = Project.search(params[:q])
    @searchedProjects = @q.result(distinct: true)
  end


  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "新規プロジェクトを作成しました"
      redirect_to projects_path
    else
      render 'zadankai/home'
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_title = @project.project_name

    # 参加しているユーザー
    @users = @project.joiner_users.group('joiner_user_id')
    # 参加しているユーザーがいる場合はそのUserを取得
    if @users.any?
    @joinerUser = @project.joiner_users.find(@users)
    end

    # Time
    @d1 = Time.zone.now
    if @project.period_date.present?
    @d2 = (@project.period_date - @d1).to_i / 1.day
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(edit_project_params)
      flash[:success] = "Your project was updated!"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = current_user.projects.find_by(id: params[:id])
    return redirect_to root_url if @project.nil?
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to projects_path
  end


  private
  def project_params
    params
      .require(:project).permit(:project_name, :brand_name, :category, :main_image, :youtube_url, :description, :period_date)
  end

  def edit_project_params
    params.require(:project).permit(:project_name, :brand_name, :category, :main_image, :youtube_url, :description, :period_date)
  end

  #project のオーナーかどうか判断
  def project_owner
    @project = Project.find(params[:id])
    unless @project.user_id == current_user.id
      flash[:notice] = 'Access denied as you are not owner of this project'
      redirect_to projects_path
    end
  end
end

