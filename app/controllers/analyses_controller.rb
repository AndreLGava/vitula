class AnalysesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_analysis, only: [:show, :edit, :update, :destroy]
  before_action :set_property, only: [:new, :edit, :update, :create, :index]

  # GET /analyses
  # GET /analyses.json
  def index
    @properties = current_user.properties
    @analyses = Analysis.them(current_user, params[:page])
  end

  # GET /analyses/1
  # GET /analyses/1.json
  def show
  end

  # GET /analyses/new
  def new
    @analysis = Analysis.new
  end

  # GET /analyses/1/edit
  def edit
  end

  # POST /analyses
  # POST /analyses.json
  def create
    @analysis = Analysis.new(analysis_params)

    respond_to do |format|
      if @analysis.save
        format.html { redirect_to @analysis, notice: I18n.t('crud.saved') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /analyses/1
  # PATCH/PUT /analyses/1.json
  def update
    respond_to do |format|
      if @analysis.update(analysis_params)
        format.html { redirect_to @analysis, notice: I18n.t('crud.saved') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /analyses/1
  # DELETE /analyses/1.json
  def destroy
    @analysis.destroy
    respond_to do |format|
      format.html { redirect_to analyses_url, notice: I18n.t('crud.destroyed') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis
      @analysis = Analysis.find(params[:id])
    end

    def set_property
      @property = Property.where(user_id: @current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def analysis_params
      params.require(:analysis).permit(:property_id, :codeanalysis, :collect, :fat, :protein, :lactose, :totalsolids, :defattedextract, :css, :scorecss, :ufc)
    end
end
