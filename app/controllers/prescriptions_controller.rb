class PrescriptionsController < ApplicationController
  
  def download_pdf
    @prescription = Prescription.find(params[:id])
    send_file @prescription.file, :type=>"application/pdf", :x_sendfile=>true
  end

  def index
    @prescriptions = Prescription.where(user_id: current_user.id) if user_signed_in? && !(current_user.dentist?) 
    @prescriptions = Prescription.where(dentist_id: current_user.dentist.id) if user_signed_in? && current_user.dentist?
  end

  def new
    @prescription = Prescription.new
    @appointment = Appointment.find(params[:format])
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @appointment = Appointment.find(params[:prescription][:appointment])
    @prescription.appointment = @appointment
    @prescription.user = @appointment.user
    @prescription.dentist = current_user.dentist
    if @prescription.save
      redirect_to prescriptions_path  
    else
      render :new
      raise
    end
  end

  def edit
    @prescription = Prescription.find(params[:id])
  end

  def update
    @prescription = Prescription.find(params[:id])
    if @prescription.update(prescription_params)
      redirect_to prescriptions_path
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:description, :file)
  end
end



