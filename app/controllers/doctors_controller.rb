class DoctorsController < ApplicationController
    def index 
        doctors = Doctor.all
        render json: doctors, status: :ok
        end
        
        def show
        doctor = Doctor.find(params[:id])
        render json: doctor, status: :ok
        end
        
        def create
        doctor = Patient.create!(doctor_params)
        render json: doctor, status: :created
        end
        
        def destroy
        doctor = Doctor.find(params[:id])
        doctor.destroy
        render json: {message: "doctor delete successfully"}, status: :success
        end
        
        def update
        doctor = Patient.find(params[:id])
        doctor.update(doctor_params)
        render json: doctor,  status: :ok
        end
        
        private 
        
        def doctor_params
        params.permit(:first_name, :email, :last_name, :specialty, :years_of_experience, :gender, :contact_number, :address, :password)
        end
        
end
