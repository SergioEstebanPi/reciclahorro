class RecolectorsController < ApplicationController
  before_action :set_recolector, only: [:show, :edit, :update, :destroy]

  # GET /recolectors
  # GET /recolectors.json
  def index
    @recolectors = Recolector.all
  end

  # GET /recolectors/1
  # GET /recolectors/1.json
  def show
  end

  # GET /recolectors/new
  def new
    @recolector = Recolector.new
  end

  # GET /recolectors/1/edit
  def edit
  end

  # POST /recolectors
  # POST /recolectors.json
  def create
    @recolector = Recolector.new(recolector_params)

    respond_to do |format|
      if @recolector.save
        format.html { redirect_to @recolector, notice: 'Recolector was successfully created.' }
        format.json { render :show, status: :created, location: @recolector }
      else
        format.html { render :new }
        format.json { render json: @recolector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recolectors/1
  # PATCH/PUT /recolectors/1.json
  def update
    respond_to do |format|
      if @recolector.update(recolector_params)
        format.html { redirect_to @recolector, notice: 'Recolector was successfully updated.' }
        format.json { render :show, status: :ok, location: @recolector }
      else
        format.html { render :edit }
        format.json { render json: @recolector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recolectors/1
  # DELETE /recolectors/1.json
  def destroy
    @recolector.destroy
    respond_to do |format|
      format.html { redirect_to recolectors_url, notice: 'Recolector was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recolector
      @recolector = Recolector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recolector_params
      params.require(:recolector).permit(:nombres, :apellidos, :fecha_nacimiento, :empresa)
    end
end
