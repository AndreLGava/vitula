class DevelopmentsController < ApplicationController
  before_action :set_development, only: [:show, :edit, :update, :destroy]

  def new
    @development = Development.new
  end

  def edit
  end

  def create
    @development = Development.new(development_params)

    @animal = Animal.find_by_id(@development.animal_id)

    @developments = @animal.developments.order(id: :desc).page params[:page]
    
    respond_to do |format|
      if @development.save
        format.html { redirect_to @development, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @development }
        format.js { render 'development', animal: @animal, developments: @developments}

      else
        format.html { render :new }
        format.json { render json: @development.errors, status: :unprocessable_entity }
        format.js { render 'new' }

      end
    end
  end

  def update
    respond_to do |format|
      if @development.update(development_params)
        format.html { redirect_to @development, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :ok, location: @development }
      else
        format.html { render :edit }
        format.json { render json: @development.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_development
      @development = Development.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def development_params
      params.require(:development).permit(:weight, :height, :animal_id)
    end
end
