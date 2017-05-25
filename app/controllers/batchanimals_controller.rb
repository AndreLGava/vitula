class BatchanimalsController < ApplicationController
  before_action :set_batchanimal, only: [:show, :edit, :update, :destroy]

  # GET /batchanimals
  # GET /batchanimals.json
  def index
    @batchanimals = Batchanimal.where(user_id: current_user.id).page params[:page]
  end

  # GET /batchanimals/1
  # GET /batchanimals/1.json
  def show
  end

  # GET /batchanimals/new
  def new
    @batchanimal = Batchanimal.new
  end

  # GET /batchanimals/1/edit
  def edit
  end

  # POST /batchanimals
  # POST /batchanimals.json
  def create
    @batchanimal = Batchanimal.new(batchanimal_params)

    respond_to do |format|
      if @batchanimal.save
        format.html { redirect_to @batchanimal, notice: 'Batchanimal was successfully created.' }
        format.json { render :show, status: :created, location: @batchanimal }
      else
        format.html { render :new }
        format.json { render json: @batchanimal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batchanimals/1
  # PATCH/PUT /batchanimals/1.json
  def update
    respond_to do |format|
      if @batchanimal.update(batchanimal_params)
        format.html { redirect_to @batchanimal, notice: 'Batchanimal was successfully updated.' }
        format.json { render :show, status: :ok, location: @batchanimal }
      else
        format.html { render :edit }
        format.json { render json: @batchanimal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batchanimals/1
  # DELETE /batchanimals/1.json
  def destroy
    @batchanimal.destroy
    respond_to do |format|
      format.html { redirect_to batchanimals_url, notice: 'Batchanimal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batchanimal
      @batchanimal = Batchanimal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batchanimal_params
      params.require(:batchanimal).permit(:user_id, :animal_id, :batch_id)
    end
end
