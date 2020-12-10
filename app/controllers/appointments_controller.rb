class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user! || :authenticate_doctor!

  def create
    @user = current_user
  	@doctor = Doctor.find(params[:id])
  	@appointment = Appointment.new(doctor: @doctor, user: @user)
  	if @appointment.save
      redirect_to root_path
  	else
  	  render "new"
  	end
  end

  def index
  	if current_user
  	  @appointments = current_user.appointments
    end
    if current_doctor
      @appointments = current_doctor.appointments
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def search
  	@doctors = Doctor.all
  end
end
