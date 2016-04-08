class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      
      t.string :commenter
      t.text :body
      t.string :avatar
      t.string :remote_avatar

      t.timestamps null: false
    end
  end
end
