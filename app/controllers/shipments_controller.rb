class ShipmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]
  before_action :set_property, only: [:new, :edit, :update, :create, :index]

  # GET /shipments
  # GET /shipments.json
  def index
    @total_litros = Shipment.where(date: Time.now.to_date.beginning_of_month..Time.now.to_date.end_of_month).sum(:amount)
    @shipments = Shipment.them(current_user, params[:page])
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
    
  end

  # GET /shipments/1/edit
  def edit
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(shipment_params)
    @shipment.amount = shipment_params[:amount].gsub(/[.]/, '').gsub(/[,]/, '.')

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice:I18n.t('crud.saved') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /shipments
  
  def update
    @shipment_params = shipment_params
    @shipment_params[:amount] = shipment_params[:amount].gsub(/[.]/, '').gsub(/[,]/, '.')
    respond_to do |format|
      if @shipment.update(@shipment_params)
        format.html { redirect_to @shipment, notice:I18n.t('crud.saved') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice:I18n.t('crud.destroyed') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
      acesso(@shipment.property.user_id, shipments_path)
    end

    def set_property
      @property = Property.where(user_id: @current_user.id)
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:amount, :date, :property_id, :financial_id)
    end
end
