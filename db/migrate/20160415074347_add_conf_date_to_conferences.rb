class AddConfDateToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :conf_date, :datetime
  end
end
