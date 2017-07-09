class IllnessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_illness, only: [:show, :edit, :update, :destroy]

  # GET /illnesses
  # GET /illnesses.json
  def index
    @illnesses = Illness.all.page params[:page]
  end

  # GET /illnesses/1
  # GET /illnesses/1.json
  def show
    @animal = Animal.find(@illness.animal_id)
    @treatments = @illness.treatments
  end

  # GET /illnesses/new
  def new
    @animal = Animal.find(params[:animal_id])
    @illness = @animal.illnesses.new
  end

  # GET /illnesses/1/edit
  def edit
  end

  # POST /illnesses
  # POST /illnesses.json
  def create
    @illness = Illness.new(illness_params)
    set_data

    respond_to do |format|
      if @illness.save
        format.js { render 'illness', animal: @animal, ilnesses: @illnesses}
      else
        format.js { render 'new' }
      end
    end
  end

  # PATCH/PUT /illnesses/1
  # PATCH/PUT /illnesses/1.json
  def update
    set_data
    respond_to do |format|
      if @illness.update(illness_params)
        format.js { render 'illness', animal: @animal, ilnesses: @illnesses}
      else
        format.js { render 'edit' }
      end
    end
  end

  # DELETE /illnesses/1
  # DELETE /illnesses/1.json
  def destroy
    set_data
    @illness.destroy
    respond_to do |format|
      format.js { render 'illness', animal: @animal, ilnesses: @illnesses}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_data
      @animal = Animal.find_by_id(@illness.animal_id)
      @illnesses = @animal.illnesses.order(id: :desc).page params[:page]
    end
    def set_illness
      @illness = Illness.find(params[:id])
      acesso(@illness.animal.user_id, root_path)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def illness_params
      params.require(:illness).permit(:startdate, :enddate, :sequel, :animal_id, :disease_id)
    end
end
