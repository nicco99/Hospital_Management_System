class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :date_of_birth, :gender, :contact_number, :address,
end
