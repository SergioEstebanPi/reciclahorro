class TiporesiduosController < ApplicationController
  before_action :set_tiporesiduo, only: [:show, :edit, :update, :destroy]

  # GET /tiporesiduos
  # GET /tiporesiduos.json
  def index
    @tiporesiduos = Tiporesiduo.all
  end

  # GET /tiporesiduos/1
  # GET /tiporesiduos/1.json
  def show
  end

  # GET /tiporesiduos/new
  def new
    @tiporesiduo = Tiporesiduo.new
  end

  # GET /tiporesiduos/1/edit
  def edit
  end

  # POST /tiporesiduos
  # POST /tiporesiduos.json
  def create
    @tiporesiduo = Tiporesiduo.new(tiporesiduo_params)

    respond_to do |format|
      if @tiporesiduo.save
        format.html { redirect_to @tiporesiduo, notice: 'Tiporesiduo was successfully created.' }
        format.json { render :show, status: :created, location: @tiporesiduo }
      else
        format.html { render :new }
        format.json { render json: @tiporesiduo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiporesiduos/1
  # PATCH/PUT /tiporesiduos/1.json
  def update
    respond_to do |format|
      if @tiporesiduo.update(tiporesiduo_params)
        format.html { redirect_to @tiporesiduo, notice: 'Tiporesiduo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tiporesiduo }
      else
        format.html { render :edit }
        format.json { render json: @tiporesiduo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiporesiduos/1
  # DELETE /tiporesiduos/1.json
  def destroy
    @tiporesiduo.destroy
    respond_to do |format|
      format.html { redirect_to tiporesiduos_url, notice: 'Tiporesiduo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tiporesiduo
      @tiporesiduo = Tiporesiduo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tiporesiduo_params
      params.require(:tiporesiduo).permit(:nombre, :descripcion)
    end
end
