class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :gender
      t.integer :contact_number
      t.string :email
      t.string :address
      t.string :password_digest

      t.timestamps
    end
  end
end
