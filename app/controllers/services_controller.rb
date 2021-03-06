class ServicesController < ApplicationController

  def index
    redirect_to root_path if !(current_user.admin)
    @Services = Service.all
  end

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

  def edit
    redirect_to root_path if !(current_user.admin)
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to procedures_path
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      redirect_to services_path
    end
  end

  private

  def service_params
    params.require(:service).permit(:title, :duration, :description, :photo)
  end
end
