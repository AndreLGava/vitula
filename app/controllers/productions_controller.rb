class ProductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_production, only: [:show, :edit, :update, :destroy]
  before_action :set_animal, only: [:new, :edit, :update]

  # GET /productions
  # GET /productions.json
  def index
    @animals = Animal.femeas(current_user)
  end

  # GET /productions/1
  # GET /productions/1.json
  def show
  end

  # GET /productions/new
  def new
    @animal = Animal.find(params[:animal_id])
    @production = @animal.productions.new
  end

  # GET /productions/1/edit
  def edit
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(production_params)

    @animal = Animal.find_by_id(@production.animal_id)

    @productions = @animal.productions.order(id: :desc).page params[:page]

    respond_to do |format|
      if @production.save
        format.html { redirect_to @production, notice: I18n.t('crud.saved') }
        format.js { render 'production', animal: @animal, productions: @productions}
      else
        format.html { render :new }
        format.js { render 'new' }
      end
    end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    respond_to do |format|
      if @production.update(production_params)
        format.html { redirect_to @production, notice: I18n.t('crud.saved') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production.destroy
    respond_to do |format|
      format.html { redirect_to productions_url, notice: I18n.t('crud.destroyed') }
    end
  end

  private

    def set_animal
      @animal = Animal.find(params[:animal_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
      acesso(@production.animal.user_id, root_path)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_params
      params.require(:production).permit(:amount, :measurement, :observation, :animal_id)
    end
end
