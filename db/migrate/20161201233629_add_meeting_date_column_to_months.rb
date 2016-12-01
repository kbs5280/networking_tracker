class AddMeetingDateColumnToMonths < ActiveRecord::Migration[5.0]
  def change
    add_column :months, :meeting_date, :string
  end
end
