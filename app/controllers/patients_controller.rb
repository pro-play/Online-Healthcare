class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @q = Doctor.ransack(params[:q])
    @doctors =  @q.result(distinct: true)
  end

  def new
    @patient = Patient.new
  end

  def login
    @patient = Patient.new
  end

  def logout
    session.delete(:patient_id)
     redirect_to :controller => 'home', :action => 'index'
  end

  def signin
    patient = Patient.find_by(email: params[:email])
       if patient.present? && patient.authenticate(params[:password])
        session[:patient_id] = patient.id
        redirect_to patient_path(patient), notice: "Logged in succesfully"
       else
        flash[:alert] = "Invalid email or password"
        render 'login'
       end
  end
  
  def prescription
    @patient = Patient.find(session[:patient_id])
    @prescriptions = Prescription.where(patient_id: session[:patient_id])
  end
  def doctorseeks
    @patient = Patient.find(session[:patient_id])
    @doctorseeks = Doctorseek.where(patient_id: session[:patient_id])
  end

  def previousrecords
    @patient = Patient.find(session[:patient_id])
    @previousrecords = Previousrecord.where(patient_id: session[:patient_id])
    
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = "Patient successfully created"
      session[:patient_id] = @patient.id
      redirect_to @patient
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to root_path
  end

  def profile
    @patient = Patient.find(session[:patient_id])
  end
  private
  def patient_params
    params.require(:patient).permit(:patient_name, :address,:gender,:dob , :email, :password, :password_confirmation, :phone, :department)
  end

  def set_patient
    
    if session[:patient_id]
      @patient = Patient.find(params[:id])
      # current.patient = Patient.find_by(id: session[:patient_id])   
      current = Patient.find(session[:patient_id])
      end
  end
end
