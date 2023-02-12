class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialty
      t.string :gender
      t.integer :contact_number
      t.string :email
      t.string :address
      t.string :password_digest
      t.integer :years_of_experience

      t.timestamps
    end
  end
end
