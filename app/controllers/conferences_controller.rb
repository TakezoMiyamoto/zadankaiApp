class ConferencesController < ApplicationController
    before_action :authenticate_user!, only: [:index, :new, :create, :show, :destroy, :edit, :update, :destroy]
    before_action :conference_owner, only: [:edit, :update, :destroy]

    require 'date'

    def index
        @project = Project.find(params[:project_id])
        redirect_to @project
    end

    def new
        @project = Project.find(params[:project_id])
        @conference = Conference.new

    end

    def create
        @project = Project.find(params[:project_id])
        @conference = @project.conferences.build(conference_params)
        if @conference.save
          flash[:success] = "座談会を作成しました！"
          redirect_to project_path(@project)
        else
          render 'new'
        end
    end

    def show
        if Project.find_by(:id => params[:project_id]) == nil
            redirect_to root_url
        else
            @project = Project.find_by(:id => params[:project_id])
        end

        if @conference = Conference.find_by(:id => params[:id]) == nil
            redirect_to @project
        else
            @conference = Conference.find(params[:id])
            @conference_title = @conference.title
        end


    end

    def edit
        @conferences = Conference.all
        @project = Project.find(params[:project_id])
        @conference = @project.conferences.find(params[:id])

    end

    def update
        @project = Project.find(params[:project_id])
        @conference = Conference.find(params[:id])
        if @conference.update(edit_conference_params)
          flash[:success] = "座談会情報を更新しました！"
          redirect_to @project
        else
          render 'edit'
        end
    end

    def destroy
        @conference = current_user.conferences.find_by(id: params[:id])
        return redirect_to root_url if @conference.nil?
        @conference.destroy
        flash[:success] = "この会議室は削除しました"
        redirect_to conferences_path
    end


    private

    def conference_params
        params.require(:conference).permit(:title, :description, :youtube_url, :conf_date)
    end

    def edit_conference_params
        params.require(:conference).permit(:title, :description, :youtube_url, :conf_date)
    end

    def conference_owner
        @project = Project.find(params[:project_id])
        @conference = Conference.find(params[:id])

        unless @project.user_id == current_user.id
          flash[:notice] = 'Access denied as you are not owner of this project'
          redirect_to projects_path
        end
    end

end
