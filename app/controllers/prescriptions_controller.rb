class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.where(user_id: current_user.id) if user_signed_in? && !(current_user.dentist?) 
    @prescriptions = Prescription.where(dentist_id: current_user.dentist.id) if user_signed_in? && current_user.dentist?
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new
    
  end

  def edit
    @prescription = Prescription.find(params[:id])
  end

  
end
