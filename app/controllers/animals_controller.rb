class AnimalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal, only: [:show, :edit, :update, :destroy]
  before_action :set_reproduction, only: [:show, :edit, :new, :create, :update, :destroy]

  first_heat = [15, 24] #moths after her birth
  heat = [18, 24] #days after parturition or abortion
  insemination = [6, 30] #hours to success
  regress = heat #days after insemination or last heat
  stop_breastfeeding = 214 #days after insemination 60 days before partturition
  parturition = 274 #days +- 7 days [267 , 282] after last insemination

  def index
    @animals = Animal.all.page params[:page]
  end

  def show
  end

  def new
    @animal = Animal.new
    @animal.productions.build
    @animal.developments.build
  end

  def edit
  end

  def create
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to animals_path, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to animals_path, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def set_reproduction
      Reproduction.all
      #Reproduction.all.map{|i| {id: i.id, parturition: i.parturition, mother: i.mother.name, father: i.father.name}}
    end

    def animal_params
      params.require(:animal).permit(:code, :name, :photo, :description, :female, :breed, :lot_id, :reproduction_id, :discard, :reason_discard, :development_attributes => [:weight, :height], :production_attributes => [:amount, :measurement, :observation])
    end
end
