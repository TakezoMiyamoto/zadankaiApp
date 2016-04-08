class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.string :title
      t.text :description

      t.timestamps null: false

      t.index [:user_id, :created_at]
      t.index [:project_id, :created_at]
    end
  end
end
