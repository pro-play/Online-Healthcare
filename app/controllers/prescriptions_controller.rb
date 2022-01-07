class PrescriptionsController < ApplicationController
    def index
        @patient = Patient.find(params[:patient_id])
        @doctorappoint = Doctorappoint.find(params[:doctorappoint_id])
        @doctor =  Doctor.find(session[:doctor_id])  
    end
    def create
        @prescription = Prescription.new(prescription_params)
        @previous_record = Previousrecord.new(previousrecord_params)
            if @prescription.save
                if @previous_record.save 
                flash[:success] = "/doctor appoint successfully created"
                redirect_to doctors_doctordiagnosis_path
                end
            else
            flash[:error] = "Something went wrong"
            render 'index'
            end
    end
   
    def show
      @doctor =  Doctor.find(session[:doctor_id])
      @patienttells = Patienttell.where(doctorappoint_id: params[:doctorappoint_id])
    end

   

    def destroy
      @prescription = Prescription.find(params[:id])
      @prescription.destroy 
  
      redirect_to patients_prescription_path
    end
    # notes:params[:notes],doctor_id:params[:doctor_id],patient_id:params[:patient_id]
    private
    def prescription_params
      params.permit( :notes, :patient_id,:doctor_id, :doctorName,:image)
    end
    def previousrecord_params
      params.permit( :notes, :patient_id,:doctor_id,:patient_name, :doctorName,:image,:symptoms)
    end
end
