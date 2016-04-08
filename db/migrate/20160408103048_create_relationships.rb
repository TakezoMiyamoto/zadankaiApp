class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :joiner_user, index: true
      t.references :joined_project, index: true

      t.timestamps null: false

      t.index [:joiner_user_id, :joined_project_id], unique: true
    end
  end
end
