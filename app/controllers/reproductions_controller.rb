class ReproductionsController < ApplicationController
  before_action :set_reproduction, only: [:show, :edit, :update, :destroy]

  # GET /reproductions
  # GET /reproductions.json
  def index
    @reproductions = Reproduction.all
  end

  # GET /reproductions/1
  # GET /reproductions/1.json
  def show
  end

  # GET /reproductions/new
  def new
    @reproduction = Reproduction.new
  end

  # GET /reproductions/1/edit
  def edit
  end

  # POST /reproductions
  # POST /reproductions.json
  def create
    @reproduction = Reproduction.new(reproduction_params)

    respond_to do |format|
      if @reproduction.save
        format.html { redirect_to @reproduction, notice: 'Reproduction was successfully created.' }
        format.json { render :show, status: :created, location: @reproduction }
      else
        format.html { render :new }
        format.json { render json: @reproduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reproductions/1
  # PATCH/PUT /reproductions/1.json
  def update
    respond_to do |format|
      if @reproduction.update(reproduction_params)
        format.html { redirect_to @reproduction, notice: 'Reproduction was successfully updated.' }
        format.json { render :show, status: :ok, location: @reproduction }
      else
        format.html { render :edit }
        format.json { render json: @reproduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reproductions/1
  # DELETE /reproductions/1.json
  def destroy
    @reproduction.destroy
    respond_to do |format|
      format.html { redirect_to reproductions_url, notice: 'Reproduction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reproduction
      @reproduction = Reproduction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reproduction_params
      params.require(:reproduction).permit(:heat, :insemination, :regress, :abortion, :parturition, :animal_id, :animal_id)
    end
end
