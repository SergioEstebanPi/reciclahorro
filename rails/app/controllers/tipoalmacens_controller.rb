class TipoalmacensController < ApplicationController
  before_action :set_tipoalmacen, only: [:show, :edit, :update, :destroy]

  # GET /tipoalmacens
  # GET /tipoalmacens.json
  def index
    @tipoalmacens = Tipoalmacen.all
  end

  # GET /tipoalmacens/1
  # GET /tipoalmacens/1.json
  def show
  end

  # GET /tipoalmacens/new
  def new
    @tipoalmacen = Tipoalmacen.new
  end

  # GET /tipoalmacens/1/edit
  def edit
  end

  # POST /tipoalmacens
  # POST /tipoalmacens.json
  def create
    @tipoalmacen = Tipoalmacen.new(tipoalmacen_params)

    respond_to do |format|
      if @tipoalmacen.save
        format.html { redirect_to @tipoalmacen, notice: 'Tipoalmacen was successfully created.' }
        format.json { render :show, status: :created, location: @tipoalmacen }
      else
        format.html { render :new }
        format.json { render json: @tipoalmacen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipoalmacens/1
  # PATCH/PUT /tipoalmacens/1.json
  def update
    respond_to do |format|
      if @tipoalmacen.update(tipoalmacen_params)
        format.html { redirect_to @tipoalmacen, notice: 'Tipoalmacen was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipoalmacen }
      else
        format.html { render :edit }
        format.json { render json: @tipoalmacen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipoalmacens/1
  # DELETE /tipoalmacens/1.json
  def destroy
    @tipoalmacen.destroy
    respond_to do |format|
      format.html { redirect_to tipoalmacens_url, notice: 'Tipoalmacen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipoalmacen
      @tipoalmacen = Tipoalmacen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipoalmacen_params
      params.require(:tipoalmacen).permit(:nombre, :descripcion)
    end
end
