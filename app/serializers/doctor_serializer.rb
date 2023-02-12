class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :email, :last_name, :specialty, :years_of_experience, :gender, :contact_number, :address
end
