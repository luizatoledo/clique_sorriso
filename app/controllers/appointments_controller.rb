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
    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment), notice: 'Seu agendamento foi atualizado.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path  
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, treatments_attributes: [:id, :procedure_id, :_destroy])
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
    
end
