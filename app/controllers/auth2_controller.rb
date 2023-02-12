class Auth2Controller < ApplicationController
    skip_before_action :authorize, only:[:create]
    def create
        patient = Patient.find_by(email: params[:email])
        if patient&.authenticate(params[:password])
            token = encode_token(patient_id: patient.id)
            render json: { patient: PatientSerializer.new(patient), jwt: token }, status: :ok
        else
            render json: { errors: "Invalid email or password" }, status: :unauthorized
        end
    end
end
