class ProceduresController < ApplicationController
  before_action :find_procedure, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def new
    redirect_to procedures_path unless current_user.dentist?
    @dentists = Dentist.all
    @dentist = Dentist.find(params[:dentist_id])
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new
    @procedure.dentist = Dentist.find(params[:procedure][:dentist])
    # @procedure.dentist = Dentist.find(params[:procedure][:dentist]) if Dentist.find(params[:procedure][:dentist]).user == current_user || current_user.admin?
    @procedure.service = Service.find(params[:procedure][:service])
    if @procedure.save
      redirect_to procedure_path(@procedure)
    else
      render :new
    end
  end

  def edit
    @dentists = Dentist.all
  end

  def update
    @procedure.service = Service.find(params[:procedure][:service]) if params[:procedure][:service].present?
    @procedure.dentist = Dentist.find(params[:procedure][:dentist]) if params[:procedure][:dentist].present? && current_user.admin
    @procedure.save
    redirect_to procedure_path(@procedure)
  end

  def show
  end

  def index
    @dentists = Dentist.all
    @procedures = Procedure.all
  end
  
  def destroy
    @procedure.destroy if can_delete?(@procedure)
    redirect_to procedures_path
  end

  private

  def find_procedure
    @procedure = Procedure.find(params[:id])
  end
  
  def can_delete?(procedure)
    procedure.treatments.each do |t1|
      return false if  (t1.appointment.time_values[:total_mins]) + t1.appointment.appoint_duration > (DateTime.now - 3 * 60 * 60)
    end
    return true
  end
end




