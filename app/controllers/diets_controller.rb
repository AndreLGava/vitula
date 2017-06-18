class DietsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diet, only: [:show, :edit, :update, :destroy]

  # GET /diets/1
  # GET /diets/1.json
  def show
    @animal = Animal.find(@diet.animal_id)
  end

  # GET /diets/new
  def new
    @animal = Animal.find(params[:animal_id])
    @diet = @animal.diets.new
  end

  # GET /diets/1/edit
  def edit
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(diet_params)
    set_data
    respond_to do |format|
      if @diet.save
        format.js { render 'diet', animal: @animal, ilnesses: @diets}
      else
        format.js { render 'new' }
      end
    end
  end

  # PATCH/PUT /diets/1
  # PATCH/PUT /diets/1.json
  def update
    set_data
    respond_to do |format|
      if @diet.update(diet_params)
        format.js { render 'diet', animal: @animal, ilnesses: @diets}
      else
        format.js { render 'edit' }
      end
    end
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    set_data
    @diet.destroy
    respond_to do |format|
      format.js { render 'diet', animal: @animal, ilnesses: @diets}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet
      @diet = Diet.find(params[:id])
    end

    def set_data
      @animal = Animal.find_by_id(@diet.animal_id)
      @diets = @animal.diets.order(id: :desc).page params[:page]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diet_params
      params.require(:diet).permit(:amount, :datestart, :dateend, :animal_id, :stock_id)
    end
end
