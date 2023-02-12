class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :patient_id, :doctor_id, :appointment_date, :appointment_time, :appointment_status, :appointment_notes
end
