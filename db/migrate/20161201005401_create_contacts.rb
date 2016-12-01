class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :linked_in
      t.string :twitter
      t.string :other
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
