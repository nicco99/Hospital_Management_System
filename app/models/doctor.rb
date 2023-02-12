class Doctor < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :patients, through: :appointments
    validates :first_name, :last_name, :specialty, :years_of_experience, :gender, :contact_number, :address, :password, presence: true
    validates :email, presence: true , uniqueness: true
end
