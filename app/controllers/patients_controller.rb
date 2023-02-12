class PatientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
# skip_before_action :authorize, only: [:create]
def index 
patients = Patient.all
render json: patients, status: :ok
end

def show
patient = Patient.find(params[:id])
render json: patient, status: :ok
end

def create
patient = Patient.create!(patient_params)
render json: patient, status: :created
end

def destroy
patient = Patient.find(params[:id])
patient.destroy
render json: {message: "delete successfully"}, status: :ok
end

def update
patient = Patient.find(params[:id])
patient.update(patient_params)
render json: patient,  status: :ok
end

private 


def record_not_found
render json: {message: "Patient not found"}, status: :not_found
end
def record_invalid invalid
render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
end

def patient_params
params.permit(:first_name, :last_name, :email, :date_of_birth, :gender, :contact_number, :address, :password)
end

end
