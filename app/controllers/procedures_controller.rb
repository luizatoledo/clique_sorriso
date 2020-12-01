class ProceduresController < ApplicationController
  before_action :find_procedure, only: %i[edit update show destroy]
  def new
    @dentists = Dentist.all
    @dentist = Dentist.find(params[:dentist_id])
    @procedure = Procedure.new
    redirect_to procedures_path unless current_user.dentist?
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
    @procedure.save
    redirect_to procedure_path(@procedure)
  end

  def show
  end

  def index
    @procedures = Procedure.all
  end
  
  def destroy
    @procedure.destroy
    redirect_to procedures_path
  end
  private

  def find_procedure
    @procedure = Procedure.find(params[:id])
  end
end
