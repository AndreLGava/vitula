class FinancialsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_financial, only: [:show, :edit, :update, :destroy]

  # GET /financials
  # GET /financials.json
  def index
    @close_last_time = Close.where(user_id: @current_user.id).empty? ? 0 : Close.where(user_id: @current_user.id).pluck(:totalvalue).last
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
    @value = params[:financial].gsub(/[.]/, '').gsub(/[,]/, '.')
    @shipments = Shipment.shipment(current_user, @date_start, @date_end)

    unless @shipments.empty?
      @financial = Financial.create(value: @value, datetransaction: Time.now.to_date, operation: 1, description: "Venda de leite de #{@date_start} até #{@date_end}. ", user_id: current_user.id)
      
      @shipments.each do |s|
        s.update(financial_id: @financial.id)
      end
    end
    redirect_to financials_path
  end

  def close_financial

  end

  def financial_close

    @close_last_time = Close.where(user_id: @current_user.id).empty? ? 0 : Close.where(user_id: @current_user.id).pluck(:totalvalue).last
    @date_start = params[:date_start]
    @date_end = params[:date_end]
    @financials = Financial.where(datetransaction: @date_start..@date_end, user_id: @current_user.id, close_id: nil)
    @credito = Financial.where(datetransaction: @date_start..@date_end, user_id: @current_user.id, close_id: nil, operation: 1).sum(:value)
    @debito = Financial.where(datetransaction: @date_start..@date_end, user_id: @current_user.id, close_id: nil, operation: 0).sum(:value)
    @total = @close_last_time + @credito - @debito

    if @credito != 0 or @debito != 0 
      @close = Close.create(
          dateclosing: @date_end,
           totalvalue: @total,
           user_id: @current_user.id
      )

      @financials.each do |f|
        f.update(close_id: @close.id)
      end
      mensagem = "Fechamento de caixa efetuado com sucesso. Valor em caixa #{@total}"
    else
      mensagem = "Não foram encontradas movimentações abertas no periodo de #{@date_start} até #{@date_end}. Por favor verifique os filtros"
    end

    redirect_to financials_path, notice: mensagem
  
  end
  def search_financial
    @date_start = params[:date_start]
    @date_end = params[:date_end]

    @financials = Financial.where(datetransaction: @date_start..@date_end, user_id: @current_user.id, close_id: nil ).order(datetransaction: :DESC)

    respond_to do |format|
      format.js { render 'search_financial', financials: @financials }
    end
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
