class PuntorecoleccionsController < ApplicationController
  before_action :set_puntorecoleccion, only: [:show, :edit, :update, :destroy]

  # GET /puntorecoleccions
  # GET /puntorecoleccions.json
  def index
    @puntorecoleccions = Puntorecoleccion.all
  end

  # GET /puntorecoleccions/1
  # GET /puntorecoleccions/1.json
  def show
  end

  # GET /puntorecoleccions/new
  def new
    @puntorecoleccion = Puntorecoleccion.new
  end

  # GET /puntorecoleccions/1/edit
  def edit
  end

  # POST /puntorecoleccions
  # POST /puntorecoleccions.json
  def create
    @puntorecoleccion = Puntorecoleccion.new(puntorecoleccion_params)

    respond_to do |format|
      if @puntorecoleccion.save
        format.html { redirect_to @puntorecoleccion, notice: 'Puntorecoleccion was successfully created.' }
        format.json { render :show, status: :created, location: @puntorecoleccion }
      else
        format.html { render :new }
        format.json { render json: @puntorecoleccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puntorecoleccions/1
  # PATCH/PUT /puntorecoleccions/1.json
  def update
    respond_to do |format|
      if @puntorecoleccion.update(puntorecoleccion_params)
        format.html { redirect_to @puntorecoleccion, notice: 'Puntorecoleccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @puntorecoleccion }
      else
        format.html { render :edit }
        format.json { render json: @puntorecoleccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puntorecoleccions/1
  # DELETE /puntorecoleccions/1.json
  def destroy
    @puntorecoleccion.destroy
    respond_to do |format|
      format.html { redirect_to puntorecoleccions_url, notice: 'Puntorecoleccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puntorecoleccion
      @puntorecoleccion = Puntorecoleccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def puntorecoleccion_params
      params.require(:puntorecoleccion).permit(:zona_id, :nombre, :descripcion, :direccion, :latitud, :longitud)
    end
end
