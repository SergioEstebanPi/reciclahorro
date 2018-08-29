class ResiduosController < ApplicationController
  before_action :set_residuo, only: [:show, :edit, :update, :destroy]

  # GET /residuos
  # GET /residuos.json
  def index
    @residuos = Residuo.all
  end

  # GET /residuos/1
  # GET /residuos/1.json
  def show
  end

  # GET /residuos/new
  def new
    @residuo = Residuo.new
  end

  # GET /residuos/1/edit
  def edit
  end

  # POST /residuos
  # POST /residuos.json
  def create
    @residuo = Residuo.new(residuo_params)

    respond_to do |format|
      if @residuo.save
        format.html { redirect_to @residuo, notice: 'Residuo was successfully created.' }
        format.json { render :show, status: :created, location: @residuo }
      else
        format.html { render :new }
        format.json { render json: @residuo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residuos/1
  # PATCH/PUT /residuos/1.json
  def update
    respond_to do |format|
      if @residuo.update(residuo_params)
        format.html { redirect_to @residuo, notice: 'Residuo was successfully updated.' }
        format.json { render :show, status: :ok, location: @residuo }
      else
        format.html { render :edit }
        format.json { render json: @residuo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residuos/1
  # DELETE /residuos/1.json
  def destroy
    @residuo.destroy
    respond_to do |format|
      format.html { redirect_to residuos_url, notice: 'Residuo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residuo
      @residuo = Residuo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residuo_params
      params.require(:residuo).permit(:tiporesiduo_id, :nombre, :descripcion)
    end
end
