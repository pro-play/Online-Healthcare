class DoctorappointsController < ApplicationController
    def index
        @patient = Patient.find(session[:patient_id])
        @doctor =  Doctor.find(params[:doctor_id])  
    end
    def create
        @doctorappoint = Doctorappoint.new(doctorappoint_params)
        @patient = Patient.find(session[:patient_id])
            if @doctorappoint.save
                flash[:success] = "/doctor appoint successfully created"
                redirect_to @patient
            else
            flash[:error] = "Something went wrong"
            render 'index'
            end
    end
    def destroy
        @doctorappoint = Doctorappoint.find(params[:id])
        @doctorappoint.destroy
    
        redirect_to doctors_doctordiagnosis_path
    end
    # notes:params[:notes],doctor_id:params[:doctor_id],patient_id:params[:patient_id]
    private
    def doctorappoint_params
      params.permit( :notes, :patient_id,:doctor_id, :patientName)
    end

end
