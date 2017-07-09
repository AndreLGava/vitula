class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]

  # GET /treatments
  # GET /treatments.json
  def index
    @treatment = Treatment.find(params[:treatment])
    set_data
    respond_to do |format|
      format.js { render 'illnesses/treatment', illness: @illness, treatments: @treatments}
    end
  end

  # GET /treatments/1
  # GET /treatments/1.json
  def show
  end

  # GET /treatments/new
  def new
    @illness = Illness.find(params[:illness_id])
    @treatment = @illness.treatments.new
    @treatment.financials.build
  end

  # GET /treatments/1/edit
  def edit
  end

  # POST /treatments
  # POST /treatments.json
  def create
    @treatment = Treatment.new(treatment_params)
    set_data
    respond_to do |format|
      if @treatment.save
        format.js { render 'illnesses/treatment', illness: @illness, treatments: @treatments}
      else
        format.js { render 'new' }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    set_data
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.js { render 'illnesses/treatment', illness: @illness, treatments: @treatments}
      else
        format.js { render 'edit' }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    set_data
    @treatment.destroy
    respond_to do |format|
      format.js { render 'illnesses/treatment', illness: @illness, treatments: @treatments}
    end
  end

  private
    def set_data
      @illness = Illness.find(@treatment.illness_id)
      @treatments = Treatment.all.where(illness: @illness)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment
      @treatment = Treatment.find(params[:id])
      acesso(@treatment.illness.animal.user_id, root_path)
      @financials = @treatment.financials
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treatment_params
      params.require(:treatment).permit(:startdate, :enddate, :dosage, :lack, :observation, :illness_id, :drug_id)
    end
end
