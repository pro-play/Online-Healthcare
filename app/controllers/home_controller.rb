class HomeController < ApplicationController
  def index
    if session[:patient_id]
      @patient = Patient.find(session[:patient_id])
    end
    if session[:doctor_id]
      @doctor = Doctor.find(session[:doctor_id])
    end
    if session[:hospital_id]
      @hospital = Hospital.find(session[:hospital_id])
    end
  end
end
