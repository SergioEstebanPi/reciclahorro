class VecinosController < ApplicationController
  before_action :set_vecino, only: [:show, :edit, :update, :destroy]

  # GET /vecinos
  # GET /vecinos.json
  def index
    @vecinos = Vecino.all
  end

  # GET /vecinos/1
  # GET /vecinos/1.json
  def show
  end

  # GET /vecinos/new
  def new
    @vecino = Vecino.new
  end

  # GET /vecinos/1/edit
  def edit
  end

  # POST /vecinos
  # POST /vecinos.json
  def create
    @vecino = Vecino.new(vecino_params)

    respond_to do |format|
      if @vecino.save
        format.html { redirect_to @vecino, notice: 'Vecino was successfully created.' }
        format.json { render :show, status: :created, location: @vecino }
      else
        format.html { render :new }
        format.json { render json: @vecino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vecinos/1
  # PATCH/PUT /vecinos/1.json
  def update
    respond_to do |format|
      if @vecino.update(vecino_params)
        format.html { redirect_to @vecino, notice: 'Vecino was successfully updated.' }
        format.json { render :show, status: :ok, location: @vecino }
      else
        format.html { render :edit }
        format.json { render json: @vecino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vecinos/1
  # DELETE /vecinos/1.json
  def destroy
    @vecino.destroy
    respond_to do |format|
      format.html { redirect_to vecinos_url, notice: 'Vecino was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vecino
      @vecino = Vecino.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vecino_params
      params.require(:vecino).permit(:documento, :nombres, :apellidos, :fecha_nacimiento, :usuario_id)
    end
end
