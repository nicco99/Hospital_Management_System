class Patient < ApplicationRecord
    has_secure_password
    has_many :appointments
    has_many :doctors, through: :appointments

    validates :first_name, :last_name, :password, :email, :date_of_birth, :gender, :contact_number, :address, presence: true
    validates :email, uniqueness: true
end
