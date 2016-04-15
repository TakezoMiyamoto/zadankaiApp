class AddPeriodDateToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :period_date, :datetime
  end
end
