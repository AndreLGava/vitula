class LotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  def index
    @lots = Lot.all.page params[:page]
  end

  def show
  end

  def new
    @lot = Lot.new
  end

  def edit
  end

  def create
    @lot = Lot.new(lot_params)

    respond_to do |format|
      if @lot.save
        format.html { redirect_to lots_path, notice: I18n.t('crud.saved') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to lots_path, notice: I18n.t('crud.saved') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @lot.destroy
    respond_to do |format|
      format.html { redirect_to lots_url, notice: I18n.t('crud.destroyed') }
    end
  end

  private
    def set_lot
      @lot = Lot.find(params[:id])
      acesso(@lot.property.user_id, financial_path)
    end

    def lot_params
      params.require(:lot).permit(:name, :description, :property_id)
    end
end
