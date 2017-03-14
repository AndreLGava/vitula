class GlebesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_glebe, only: [:show, :edit, :update, :destroy]

  # GET /glebes
  # GET /glebes.json
  def index
    @property = Property.find(params[:property_id])
    @glebes = Glebe.them(@property, params[:pages])
  end

  # GET /glebes/1
  # GET /glebes/1.json
  def show
  end

  # GET /glebes/new
  def new
    @property = Property.find(params[:property_id])
    @glebe = @property.glebes.new
  end

  # GET /glebes/1/edit
  def edit
  end

  # POST /glebes
  # POST /glebes.json
  def create
    @glebe = Glebe.new(glebe_params)
    @property = Property.find(@glebe.property_id)
    @glebes = Glebe.them(@property, params[:page])

    respond_to do |format|
      if @glebe.save
        format.html { redirect_to @glebe, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @glebe }
        format.js { render 'properties/property_glebes', property: @property, glebes: @glebes}
      else
        format.html { render :new }
        format.json { render json: @glebe.errors, status: :unprocessable_entity }
        format.js { render 'new' }
      end
    end
  end

  # PATCH/PUT /glebes/1
  # PATCH/PUT /glebes/1.json
  def update
    respond_to do |format|
      if @glebe.update(glebe_params)
        format.html { redirect_to @glebe, notice: I18n.t('crud.updated') }
        format.json { render :show, status: :ok, location: @glebe }
      else
        format.html { render :edit }
        format.json { render json: @glebe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glebes/1
  # DELETE /glebes/1.json
  def destroy
    @glebe.destroy
    respond_to do |format|
      format.html { redirect_to glebes_url, notice: I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glebe
      @glebe = Glebe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def glebe_params
      params.require(:glebe).permit(:name, :purpose, :area, :property_id)
    end
end
