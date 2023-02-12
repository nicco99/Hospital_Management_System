class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.string :appointment_date
      t.string :appointment_time
      t.string :appointment_status
      t.string :appointment_notes

      t.timestamps
    end
  end
end
