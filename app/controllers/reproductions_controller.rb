class ReproductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reproduction, only: [:show, :edit, :update, :destroy]

  def index
    @reproductions = Reproduction.all
  end

  def show
  end

  def new
    @reproduction = Reproduction.new
    set_parents
  end

  def edit
    set_parents
  end

  def create
    @reproduction = Reproduction.new(reproduction_params)

    respond_to do |format|
      if @reproduction.save
        format.html { redirect_to reproductions_path, notice: 'Reproduction was successfully created.' }
        format.json { render :show, status: :created, location: @reproduction }
      else
        format.html { render :new }
        format.json { render json: @reproduction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reproduction.update(reproduction_params)
        format.html { redirect_to reproductions_path, notice: 'Reproduction was successfully updated.' }
        format.json { render :show, status: :ok, location: @reproduction }
      else
        format.html { render :edit }
        format.json { render json: @reproduction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reproduction.destroy
    respond_to do |format|
      format.html { redirect_to reproductions_url, notice: 'Reproduction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_reproduction
      @reproduction = Reproduction.find(params[:id])
    end

    def set_parents
      @mother = Animal.where('female' => true, 'discard' => nil)
      @father = Animal.where('female' => false, 'discard' => nil)
    end

    def reproduction_params
      params.require(:reproduction).permit(:heat, :insemination, :regress, :abortion, :stop_breastfeeding, :parturition, :mother_id, :father_id)
    end
end
