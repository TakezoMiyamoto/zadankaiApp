class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update, :destroy]

    def create
        @project = Project.find(params[:project_id])
        @comment = @project.comments.build(comment_params)
        @comment.commenter = current_user.nickname
        @comment.avatar = current_user.avatar.url
        @comment.remote_avatar = current_user.remote_avatar

        if @comment.save
          flash[:success] = "コメントを投稿しました！"
          redirect_to project_path(@project)
        else
          redirect_to @project
        end
    end

    def edit
        @project = Project.find(params[:project_id])
        @comment = @project.comments.find(params[:id])
    end

    def update
        @project = Project.find(params[:project_id])
        @comment = @project.comments.find(params[:id])
      if @comment.update(edit_comment_params)
        flash[:success] = "Your comment was updated!"
        redirect_to @project
      else
        render 'edit'
      end
    end

    def destroy
        @project = Project.find(params[:project_id])
        @comment = @project.comments.find_by(id: params[:id])
            return redirect_to root_url if @comment.nil?
        @comment.destroy
        flash[:success] = "Comment deleted"
        redirect_to @project
    end

    private

    def comment_params
        params.require(:comment).permit(:commenter, :body, :avatar, :remote_avatar)
    end

    def edit_comment_params
        params.require(:comment).permit(:commenter, :body, :avatar, :remote_avatar)
    end
end

