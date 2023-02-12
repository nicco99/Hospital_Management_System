class Auth1Controller < ApplicationController
    skip_before_action :authorize, only:[:create]
    def create
        doctor = Doctor.find_by(email: params[:email])
        if doctor&.authenticate(params[:password])
            token = encode_token(doctor_id: doctor.id)
            render json: { doctor: DoctorSerializer.new(doctor), jwt: token }, status: :ok
        else
            render json: { errors: "Invalid email or password" }, status: :unauthorized
        end
    end
end
