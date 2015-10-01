class ChangeStatisticDefaultValue < ActiveRecord::Migration
  def change
    change_column_default(:statistics, :visit, 0)
    change_column_default(:statistics, :unique_visit, 0)
  end
end
