class LaboratoriesController < ApplicationController
  before_action :set_laboratory, only: [:show, :edit, :update, :destroy]

  # GET /laboratories
  # GET /laboratories.json
  def index
    @laboratories = Laboratory.all
    @markers = @laboratories.geocoded.map do |labo|
      {
        lat: labo.latitude,
        lng: labo.longitude,
        name: '',
        infoWindow: render_to_string(partial: "info_window", locals: { laboratory: labo })
      }
    end
  end

  # GET /laboratories/1
  # GET /laboratories/1.json
  # GET /laboratories/new
  def show
    @laboratory = Laboratory.find(params[:id])
    @markers = [{ lat: @laboratory.latitude, lng:@laboratory.longitude, name: @laboratory.name }]
    #  {
    #     lat: labo.latitude,
    #     lng: labo.longitude,
    #     name: labo.name
    #   }
    # end
    @site = find_site
  end

  # GET /laboratories/1/edit
  
  # POST /laboratories
  # POST /laboratories.json
  def create
    @laboratory = Laboratory.new(laboratory_params)

    respond_to do |format|
      if @laboratory.save
        format.html { redirect_to @laboratory, notice: 'Laboratory was successfully created.' }
        format.json { render :show, status: :created, location: @laboratory }
      else
        format.html { render :new }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratories/1
  # PATCH/PUT /laboratories/1.json
  def update
    respond_to do |format|
      if @laboratory.update(laboratory_params)
        format.html { redirect_to @laboratory, notice: 'Laboratory was successfully updated.' }
        format.json { render :show, status: :ok, location: @laboratory }
      else
        format.html { render :edit }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratories/1
  # DELETE /laboratories/1.json
  def destroy
    @laboratory.destroy
    respond_to do |format|
      format.html { redirect_to laboratories_url, notice: 'Laboratory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratory
      @laboratory = Laboratory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laboratory_params
      params.require(:laboratory).permit(:name, :address)
    end

    def find_site
      case @laboratory.name.downcase.first(3)
      when "pap"
        "https://papaizdiagnosticos.com.br/documentacao/?gclid=Cj0KCQiA5bz-BRD-ARIsABjT4ni2cJwxRv1ZU_mCjhPo6fDV3bBipO3VFn9MqXztnWXQADl-_RrcBj8aAgYxEALw_wcB"
      when "ind"
        "http://www.indor.com.br/index2.html"
      when "iso"
        "http://www.isoradiologia.com.br/"
      end
    end
        
end
