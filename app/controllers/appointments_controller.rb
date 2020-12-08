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
      if @appointment.services.count == 1 && @appointment.services.first.title == "Consulta Online"
        chatroom = Chatroom.new(name: "Consulta online", appointment_id: @appointment.id)
        chatroom.save
      end
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
  
  def selected_procedures
    procedure = Procedure.find(params[:procedure_id])
    render json: procedure
    return procedure
  end

  def selected_day
    day = params[:date_picked]
    render json: [day]
    return day
  end

  def available_hours
    proc = selected_procedures
    date = selected_day
    @doc = proc.dentist
    appoint_of_day = []
    @doc.appointments.uniq.each do |a|
      if a.date.strftime('%d-%m-%Y') == date.strftime('%d-%m-%Y')
        appoint_of_day << a
      end
    end
    @available = appoint_of_day
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, treatments_attributes: [:id, :procedure_id, :_destroy])
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
    
end
