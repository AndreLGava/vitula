class ReproductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reproduction, only: [:show, :edit, :update, :destroy]
  before_action :set_father, only: [:new, :edit, :update, :create]


  def new
    @mother = Animal.find(params[:mother_id])
    @reproduction = @mother.reproductions_as_mother.new
  end

  def edit
  end

  def create
    @reproduction = Reproduction.new(reproduction_params)

    respond_to do |format|
      if @reproduction.save
        format.html { redirect_to reproductions_path, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @reproduction }
        format.js { render 'reproduction' }
      else
        format.html { render :new }
        format.json { render json: @reproduction.errors, status: :unprocessable_entity }
        format.js { render 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @reproduction.update(reproduction_params)
        format.html { redirect_to reproductions_path, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :ok, location: @reproduction }
      else
        format.html { render :edit }
        format.json { render json: @reproduction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_reproduction
      @reproduction = Reproduction.find(params[:id])
    end

    def set_father
      @father = Animal.where('female' => false, 'discard' => nil)
    end

    def reproduction_params
      params.require(:reproduction).permit(:heat, :insemination, :regress, :abortion, :stop_breastfeeding, :parturition, :mother_id, :father_id)
    end
end
