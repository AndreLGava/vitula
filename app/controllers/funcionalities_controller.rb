class FuncionalitiesController < ApplicationController
  before_action :set_funcionality, only: [:show, :edit, :update, :destroy]

  def index
    @funcionalities = Funcionality.all
  end

  def show
  end

  def new
    @funcionality = Funcionality.new
  end

  def edit
  end

  def create
    @funcionality = Funcionality.new(funcionality_params)
    respond_to do |format|
      if @funcionality.save
        format.html { redirect_to @funcionality, notice: 'Funcionality was successfully created.' }
        format.json { render :show, status: :created, location: @funcionality }
      else
        format.html { render :new }
        format.json { render json: @funcionality.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @funcionality.update(funcionality_params)
        format.html { redirect_to @funcionality, notice: 'Funcionality was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcionality }
      else
        format.html { render :edit }
        format.json { render json: @funcionality.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @funcionality.destroy
    respond_to do |format|
      format.html { redirect_to funcionalities_url, notice: 'Funcionality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_funcionality
      @funcionality = Funcionality.find(params[:id])
    end

    def funcionality_params
      params.require(:funcionality).permit(:name, :description, :modulo_id)
    end
end
