class RemovePeriodDateFromConferences < ActiveRecord::Migration
  def change
    remove_column :conferences, :period_date, :datetime
  end
end
