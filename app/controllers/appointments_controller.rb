class AppointmentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
        def index 
        appointments = Appointment.all
        render json: appointments, status: :ok
        end
        
        def show
        appointment = Appointment.find(params[:id])
        render json: appointment, status: :ok
        end
        
        def create
        appointment = Appointment.create!(appointment_params)
        render json: appointment, status: :created
        end
        
        def destroy
        appointment = Appointment.find(params[:id])
        appointment.destroy
        render json: {message: "appointment delete successfully"}, status: :ok
        end
        
        def update
        appointment = Appointment.find(params[:id])
        appointment.update(appointment_params)
        render json: appointment,  status: :ok
        end
        
        private 

        def appointment_params
        params.permit(:patient_id, :doctor_id, :appointment_date, :appointment_time, :appointment_status, :appointment_notes)
        end

        def record_not_found
         render json: {error: "Appointment not found"}, status: :not_found
        end

        def record_invalid invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        end
end
