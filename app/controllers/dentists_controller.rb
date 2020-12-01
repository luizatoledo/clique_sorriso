class DentistsController < ApplicationController
  before_action :set_dentist, only: [:show, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @dentists = Dentist.all
  end

  def show
  end

  def new
    @dentist = Dentist.new
  end

  def create
    @dentist = Dentist.new(dentist_params)
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

  private

  def set_dentist
    @dentist = Dentist.find(params[:id])
  end

  def dentist_params
    if current_user.admin
      params.require(:dentist).permit(:cro, :specialty, :approved)
    else
      params.require(:dentist).permit(:cro, :specialty)
    end
  end
end
