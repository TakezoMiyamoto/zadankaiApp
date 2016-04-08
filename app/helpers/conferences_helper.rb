module ConferencesHelper
  def embed(youtube_url)
        @project = Project.find(params[:project_id])
        @conference = @project.conferences.find(params[:conference_id])
    if @conference.youtube_url.present?
        youtube_id = youtube_url.split("=").last
        content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
    end
  end
end
