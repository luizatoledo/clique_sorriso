class ServicesController < ApplicationController
  def new
    redirect_to root_path if !(current_user.admin)
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if current_user.admin && @service.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:title, :duration, :description)
  end
end
