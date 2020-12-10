class AppointmentsController < ApplicationController
  before_action :find_appointment, only: %i[edit update show destroy videocall]

  def index
    @user = current_user
    if current_user.dentist?
      @appointments = current_user.dentist.appointments
    else
      @appointments = Appointment.where(user: @user)
    end
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
    #@appointment.date = @appointment.date.change(offset: '-03:00') - 3.hours + (@appointment.time.first(2).to_i * 60 + @appointment.time.last(2).to_i).minutes
    if @appointment.save
    # (@appointment.date + @appointment.time_values[:total_mins] *60 ) >= DateTime.now &&
      # if !(if_dentist_busy_this_time?(@appointment))
      #   @appointment.destroy
      #   flash[:alert] = "Dentista ocupado neste horário, desculpe. Por favor, remarque com outro horário."
      #   render :new
      # elsif @appointment.services.first.title == "Consulta Online"
      #   chatroom = Chatroom.new(name: "Consulta online", appointment_id: @appointment.id)
      #   chatroom.save
      #   redirect_to appointments_path
      # end
      chatroom = Chatroom.new(name: "Consulta online", appointment_id: @appointment.id)
      chatroom.save
      redirect_to appointments_path
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
    # available = []
    # appoint_of_day.each do |app|
    appoint_of_day
  end

  def videocall
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, treatments_attributes: [:id, :procedure_id, :_destroy])
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def if_dentist_busy_this_time?(appointment)
    p_duration = 0
    appointment.procedures.order(:dentist_id).each do |p|
      p_start_time = Time.parse(appointment.time) + (p_duration * 60)
      p_duration += p.service.duration
      p_end_time = Time.parse(appointment.time) + (p_duration.minutes * 60)
      his_appointments_that_day = p.dentist.appointments.select { |a| a.date.to_s.first(10) == appointment.date.to_s.first(10) }    
      his_appointments_that_day.each do |reserved_appointment|
        procedure_duration = 0
        reserved_appointment.procedures.order(:dentist_id).each do |procedure|
          procedure_start_time = Time.parse(reserved_appointment.time) + procedure_duration * 60
          procedure_duration += procedure.service.duration
          procedure_end_time = Time.parse(reserved_appointment.time) + procedure_duration * 60
          return false if !(p_start_time > procedure_end_time || p_end_time < procedure_start_time)
        end
      end
    end
    return true
  end
end