class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true, foreign_key: true
      t.string :project_name
      t.string :brand_name
      t.string :category
      t.string :main_image
      t.string :youtube_url
      t.text :description
      t.datetime :period_date

      t.timestamps null: false

      t.index [:user_id, :created_at]
    end
  end
end
