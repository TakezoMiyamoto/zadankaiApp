class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :place, :string
    add_column :users, :birth, :date
    add_column :users, :gender, :string
    add_column :users, :introduce, :text
  end
end
