class FinancialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_financial, only: [:show, :edit, :update, :destroy]

  # GET /financials
  # GET /financials.json
  def index
    if params[:operation]
      @financials = Financial.where(user_id: current_user.id, operation: params[:operation]).order(id: :desc).page params[:page]
    else
      @financials = Financial.where(user_id: current_user.id).order(id: :desc).page params[:page]
    end
  end

  # GET /financials/1
  # GET /financials/1.json
  def show
  end

  # GET /financials/new
  def new
    @financial = Financial.new
  end

  def new_financial_ajax
    @model_name = params[:model]
    @model = @model_name.singularize.classify.constantize.find(params[:id])
    @financial = @model.financials.new
  end

  # GET /financials/1/edit
  def edit
  end

  # POST /financials
  # POST /financials.json
  def create
    
    @financial = Financial.new(financial_params)
    @financial.value = financial_params[:value].gsub(/[.]/, '').gsub(/[,]/, '.')

    @financial.user_id = @current_user.id
    respond_to do |format|
      if @financial.save
        format.html { redirect_to @financial, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @financial }
        format.js   { render 'financial_show', financials: @financial}
      else
        format.html { render :new }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
        format.js   { render 'new_financial_ajax'}
      end
    end
  end

  # PATCH/PUT /financials/1
  # PATCH/PUT /financials/1.json
  def update
    @financial_params = financial_params
    @financial_params[:value] = financial_params[:value].gsub(/[.]/, '').gsub(/[,]/, '.')
    respond_to do |format|
      if @financial.update(@financial_params)
        format.html { redirect_to @financial, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :ok, location: @financial }
      else
        format.html { render :edit }
        format.json { render json: @financial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financials/1
  # DELETE /financials/1.json
  def destroy
    @financial.destroy
    respond_to do |format|
      format.html { redirect_to financials_url, notice: I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  def shipment_financial

  end

  def financial_shipment
    @date_start = params[:date_start]
    @date_end = params[:date_end]

    @valor_litro = params[:valor_litro].gsub(/[.]/,'').gsub(/[,]/, '.') unless params[:valor_litro].nil?
    @b_bacteria = params[:b_bacteria].gsub(/[.]/,'').gsub(/[,]/, '.') unless params[:b_bacteria].nil?
    @b_ccs = params[:b_ccs].gsub(/[.]/,'').gsub(/[,]/, '.') unless params[:b_ccs].nil?
    @b_gordura = params[:b_gordura].gsub(/[.]/,'').gsub(/[,]/, '.') unless params[:b_gordura].nil?
    @b_tanque = params[:b_tanque].gsub(/[.]/,'').gsub(/[,]/, '.') unless params[:b_tanque].nil?
    @b_canalizacao = params[:b_canalizacao].gsub(/[.]/,'').gsub(/[,]/, '.') unless params[:b_canalizacao].nil?
    @b_frete = params[:b_frete].gsub(/[.]/,'').gsub(/[,]/, '.') unless params[:b_frete].nil?
    @b_compra = params[:b_compra].gsub(/[.]/,'').gsub(/[,]/, '.') unless params[:b_compra].nil?
    @value = params[:financial].gsub(/[.]/, '').gsub(/[,]/, '.') unless params[:financial].nil?
    @shipments = Shipment.shipment(current_user, @date_start, @date_end)

    unless @shipments.empty?
      @financial = Financial.create(value: @value, datetransaction: Time.now.to_date, operation: 1, description: "Venda de leite de #{@date_start} até #{@date_end}. ", user_id: current_user.id, 
        valor_litro: @valor_litro,
b_bacteria: @b_bacteria,
b_ccs: @b_ccs,
b_gordura: @b_gordura,
b_tanque: @b_tanque,
b_canalizacao: @b_canalizacao,
b_frete: @b_frete,
b_compra: @b_compra)
      
      @shipments.each do |s|
        s.update(financial_id: @financial.id)
      end
    end
    redirect_to financials_path
  end

  def close_financial
    @credito = Financial.where(user_id: current_user.id, operation: 1, close_id: nil).order(id: :desc)
    @debito = Financial.where(user_id: current_user.id, operation: 0, close_id: nil).order(id: :desc)
    #soma
    #credito.sum(:value)
    binding.pry

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial
      @financial = Financial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_params
      params.require(:financial).permit(:valor_litro, :b_ccs, :b_bacteria, :b_gordura, :b_tanque, :b_canalizacao, :b_frete, :b_compra, :datestart, :dateend, :value, :datetransaction, :operation, :description, :animal_id, :service_id, :employee_id, :reproduction_id, :stock_id, :treatment_id, :shipment_id, :schedule_id, :service_id, :user_id)
    end

end
