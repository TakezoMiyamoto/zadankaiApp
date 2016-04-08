class AddYoutubeUrlToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :youtube_url, :string
  end
end
