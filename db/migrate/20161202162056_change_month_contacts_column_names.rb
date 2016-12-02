class ChangeMonthContactsColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :month_contacts, :months_id, :month_id
    rename_column :month_contacts, :contacts_id, :contact_id

  end
end
