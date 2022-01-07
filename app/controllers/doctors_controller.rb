class DoctorsController < ApplicationController
    def create
        @hospital = Hospital.find(params[:hospital_id])
        @doctor = @hospital.doctors.create(doctor_params)
        redirect_to hospital_path(@hospital)
      end
    def edit
      
    end  

    def new
    end

   
  
    def login
      @doctor = Doctor.new
    end
  
    def logout
      session.delete(:doctor_id)
       redirect_to :controller => 'home', :action => 'index'
    end
  
    def signin
      doctor = Doctor.find_by(email: params[:email])
         if doctor.present? && doctor.authenticate(params[:password])
          session[:doctor_id] = doctor.id
          redirect_to doctors_doctordiagnosis_path(doctor), notice: "Logged in succesfully"
         else
          flash[:alert] = "Invalid email or password"
          render 'login'
         end
    end
    
    def doctordiagnosis
      @doctor = Doctor.find(session[:doctor_id])
      @doctorappoints = Doctorappoint.where(doctor_id: session[:doctor_id])
      # @patient = Patient.find_by(id: @doctorappoint.patient_id)
    end

    def previousrecords
      @doctor = Doctor.find(session[:doctor_id])
      @previousrecords = Previousrecord.where(doctor_id: session[:doctor_id])
      
    end
    
    def index
        @doctors =  Doctor.where(hospital_id: params[:hospital_id])
        @hospital = Hospital.find(session[:hospital_id])
    end
      private
        def doctor_params
          params.require(:doctor).permit(:doctor_name, :address, :department, :qualification,:hospital_name, :dob, :gender, :email, :password, :password_confirmation, :phone)
        end
        def set_doctor
    
          if session[:doctor_id]
            @doctor = Doctor.find(params[:id])
            # current.doctor = doctor.find_by(id: session[:doctor_id])   
            end
        end  
end
