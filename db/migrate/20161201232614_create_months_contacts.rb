class CreateMonthsContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :month_contacts do |t|
      t.references :months, foreign_key: true
      t.references :contacts, foreign_key: true
    end
  end
end
