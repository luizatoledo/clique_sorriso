class AppointmentsController < ApplicationController
  before_action :find_appointment, only: %i[edit update show destroy]

  def index
    @user = current_user
    @appointments = Appointment.where(user: @user)
  end

  def show
  end

  def new
    @appointment = Appointment.new
    @treatment = Treatment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    # @treatment = Treatment.new
    if @appointment.save
      # @treatment.appointment = @appointment
      # @treatment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, treatments_attributes: [:id, :procedure_id, :_destroy])
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
    
end
