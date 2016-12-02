class AddDefaultToMonths < ActiveRecord::Migration[5.0]
  def change
    change_column_default :months, :date, Time.now
    change_column_default :months, :meeting_date, Time.now
  end
end
