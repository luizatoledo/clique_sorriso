class DentistsController < ApplicationController
  before_action :set_dentist, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @dentists = Dentist.all
  end

  def show
    redirect_to dentists_path unless (@dentist.user.role == 'dentist' && @dentist.approved) || current_user.admin
  end

  def new
    @dentist = Dentist.new
  end

  def create
    @dentist = Dentist.new(dentist_params)
    if current_user.admin
      @dentist.user.role = 'dentist' if @dentist.approved
    end
    if @dentist.save
      redirect_to dentist_path(@dentist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dentist.update(dentist_params)
      redirect_to dentist_path
    else
      render :edit
    end
  end

  def destroy
    @dentist.destroy
    redirect_to dentists_path
  end

  def unavailable
    procedure = Procedure.find(params[:procedure_id])
    day = params[:date_picked]
    doc = procedure.dentist
    day_appoints = Appointment.where(date: day)
    # dates = []
    # procedure.dentist.appointments.uniq.each do |appointment|
    #   end_time = appointment.date + (appointment.appoint_duration * 60)
    #   dates << {from: appointment.date.strftime('%d-%m-%Y %H:%M'), to: end_time.strftime('%d-%m-%Y %H:%M') }
    #   # dates << appointment.date.to_date
    # end
    # render json: dates
    procedure.dentist.appointments.uniq.each do |appointment|
    end
  end

  def available_hours
    

  end

  private

  def set_dentist
    @dentist = Dentist.find(params[:id])
  end

  def dentist_params
    if current_user.admin
      params.require(:dentist).permit(:cro, :specialty, :approved, :user_id)
    elsif current_user.dentist?
      params.require(:dentist).permit(:cro, :specialty)
    end
  end
end
