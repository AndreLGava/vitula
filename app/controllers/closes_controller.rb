class ClosesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_close, only: [:show, :edit, :update, :destroy]

  # GET /closes
  # GET /closes.json
  def index
    @closes = Close.all
  end

  # GET /closes/1
  # GET /closes/1.json
  def show
  end

  # GET /closes/new
  def new
    @close = Close.new
  end

  # GET /closes/1/edit
  def edit
  end

  # POST /closes
  # POST /closes.json
  def create
    @close = Close.new(close_params)

    respond_to do |format|
      if @close.save
        format.html { redirect_to @close, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @close }
      else
        format.html { render :new }
        format.json { render json: @close.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /closes/1
  # PATCH/PUT /closes/1.json
  def update
    respond_to do |format|
      if @close.update(close_params)
        format.html { redirect_to @close, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :ok, location: @close }
      else
        format.html { render :edit }
        format.json { render json: @close.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /closes/1
  # DELETE /closes/1.json
  def destroy
    @close.destroy
    respond_to do |format|
      format.html { redirect_to closes_url, notice: I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_close
      @close = Close.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def close_params
      params.require(:close).permit(:dateclosing, :totalvalue)
    end
end
