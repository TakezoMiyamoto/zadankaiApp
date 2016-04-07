class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :text
    add_column :users, :uid, :text
    add_column :users, :avatar, :text
    add_column :users, :remote_avatar, :text
  end
end
