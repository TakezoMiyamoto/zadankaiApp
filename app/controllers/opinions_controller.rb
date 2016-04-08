class OpinionsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update, :destroy]

    def create
        @project = Project.find(params[:project_id])
        @conference = @project.conferences.find(params[:conference_id])
        @opinion = @conference.opinions.build(opinion_params)
        @opinion.opinion_user = current_user.nickname
        @opinion.avatar = current_user.avatar.url
        @opinion.remote_avatar = current_user.remote_avatar

        if @opinion.save
          flash[:success] = "コメントを投稿しました！"
          redirect_to project_conference_path(@project, @conference)
        else
          redirect_to project_conference_path(@project, @conference)
        end
    end

    def edit
        @project = Project.find(params[:project_id])
        @conference = @project.conferences.find(params[:conference_id])
        @opinion = @conference.opinions.find (params[:id])
    end

    def update
        @project = Project.find(params[:project_id])
        @conference = @project.conferences.find(params[:conference_id])
        @opinion = @conference.opinions.find(params[:id])
      if @opinion.update(edit_opinion_params)
        flash[:success] = "Your comment was updated!"
        redirect_to (project_conference_path(@project, @conference))
      else
        render 'edit'
      end
    end

    def destroy
        @project = Project.find(params[:project_id])
        @conference = @project.conferences.find(params[:conference_id])
        @opinion = @conference.opinions.find_by(id: params[:id])
            return redirect_to root_url if @opinion.nil?
        @opinion.destroy
        flash[:success] = "Comment deleted"
        redirect_to :back
    end


    private

    def opinion_params
        params.require(:opinion).
        permit(
            :opinion_user,
            :body,
            :avatar,
            :remote_avatar
            )
    end
    def edit_opinion_params
        params.require(:opinion).
        permit(:opinion_user,
        :body,
        :avatar,
        :remote_avatar)
    end

end

