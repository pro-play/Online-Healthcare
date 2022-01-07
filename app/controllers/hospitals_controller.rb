class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
    @hospital = Hospital.new
  end

  def login
    @hospital = Hospital.new
  end

  def logout
    session.delete(:hospital_id)
     redirect_to :controller => 'home', :action => 'index'
  end

  def signin
    hospital = Hospital.find_by(email: params[:email])
       if hospital.present? && hospital.authenticate(params[:password])
        session[:hospital_id] = hospital.id
        redirect_to hospital_path(hospital), notice: "Logged in succesfully"
       else
        flash[:alert] = "Invalid email or password"
        render 'login'
       end
  end

  
  
  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      flash[:success] = "Hospital successfully created"
      session[:hospital_id] = @hospital.id
      redirect_to @hospital
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])

    if @hospital.update(hospital_params)
      redirect_to @hospital
    else
      render :edit
    end
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy

    redirect_to hospitals_path
  end

  private
  def hospital_params
    params.require(:hospital).permit(:hospital_name, :address, :email, :password, :password_confirmation, :phone)
  end
  
end
