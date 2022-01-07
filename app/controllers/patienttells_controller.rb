class PatienttellsController < ApplicationController
    def index
        @patient = Patient.find(session[:patient_id])
        @doctorappoint = Doctorappoint.find(params[:doctorappoint_id])
        @doctor =  Doctor.find(params[:doctor_id])  
    end
    def create
        @patienttell = Patienttell.new(patienttell_params)
        @patient = Patient.find(session[:patient_id])
            if @patienttell.save
                flash[:success] = "/doctor appoint successfully created"
                redirect_to @patient
            else
            flash[:error] = "Something went wrong"
            render 'index'
            end
    end

    private
    def patienttell_params
      params.permit( :notes, :patient_name, :patient_id,:doctor_id,:doctorappoint_id)
    end
end
