class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.string :name
      t.string :method, default: 'n/a'
      t.string :date
      t.integer :meeting, default: 0
    end
  end
end
