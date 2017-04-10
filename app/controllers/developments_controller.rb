class DevelopmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_development, only: [:show, :edit, :update, :destroy]

  def new
    @animal = Animal.find(params[:animal_id])
    @development = @animal.developments.new
  end

  def edit
  end

  def create
    @development = Development.new(development_params)

    @animal = Animal.find_by_id(@development.animal_id)

    @developments = @animal.developments.order(id: :desc).page params[:page]
    
    respond_to do |format|
      if @development.save
        format.js { render 'development', animal: @animal, developments: @developments}

      else
        format.js { render 'new' }

      end
    end
  end

  def update
    respond_to do |format|
      if @development.update(development_params)
        format.html { redirect_to @development, notice: I18n.t('crud.saved') }
      else
        format.html { render :edit }
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
