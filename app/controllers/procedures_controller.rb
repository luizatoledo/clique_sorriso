class ProceduresController < ApplicationController
  def new
    raise
    @procedure = Procedure.new
    @dentist = Dentist.find(params[:dentist_id])
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
    @procedure = Procedure.find(params[:procedure][:dentist])
  end

  def show
    @procedure = Procedure.find(params[:id])
  end

  def index
    @procedures = Procedure.all
  end

  # private
  # def procedure_params
  #   params.require(:procedure).permit(:dentist_id, :service_id)
  # end
end
