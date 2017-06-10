class AnimalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :animal_development, :animal_production, :animal_reproduction, :animal_illness, :animal_diet]
  before_action :set_reproduction, only: [:show, :edit, :new, :create, :update, :destroy]

  def index
    redirect_to properties_path unless current_user.has_property?
    if params[:pesquisa]
      @animals = Animal.animais(current_user, params[:page]).pesquisa(params[:pesquisa]) 
    else
      @animals = Animal.animais(current_user, params[:page]) 
    end  
  end  

  def all_animals
    @animals = Animal.animais(current_user, params[:page])
  end

  def descartados
    @animals = Animal.descartados(current_user)
  end

  def stopped
    @animals = Animal.stopped(current_user)
  end

  def show
  end

  def new
    @reproduction = Reproduction.all
    if params[:reproduction].nil?
      @animal = Animal.new
    else
      @set_reproduction = Reproduction.find(params[:reproduction])
      @animal = Animal.new(reproduction: @set_reproduction)
    end
    @animal.productions.build
    @animal.developments.build
    @animal.illnesses.build
    @animal.diets.build
    @animal.financials.build
  end

  def edit
  end

  def create
    @animal = Animal.new(animal_params)
    respond_to do |format|
      if @animal.save
        if @animal.donor == true 
          format.html { redirect_to donors_path, notice: I18n.t('crud.saved') }
        else
          format.html { redirect_to animals_path, notice: I18n.t('crud.saved') }
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @animal.update(animal_params)
        if @animal.donor == true 
          format.html { redirect_to donors_path, notice: I18n.t('crud.saved') }
        else
          format.html { redirect_to animals_path, notice: I18n.t('crud.saved') }
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: I18n.t('crud.destroyed') }
    end
  end

  def animal_production
    @productions = @animal.productions.order(id: :desc).page params[:page]
  end

  def animal_development
    @developments = @animal.developments.order(id: :desc).page params[:page]
  end

  def animal_reproduction
    @reproductions = @animal.reproductions.order(id: :desc).page params[:page]
  end

  def animal_illness
    @illnesses = @animal.illnesses.order(id: :desc).page params[:page]
  end

  def animal_diet
    @diets = @animal.diets.order(id: :desc).page params[:page]
  end

  private
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def set_reproduction
      id = @animal.id unless @animal.nil?
      Reproduction.where.not(mother_id: id).where("reproduction.parturition is not null")
      #Reproduction.all.map{|i| {id: i.id, parturition: i.parturition, mother: i.mother.name, father: i.father.name}}
    end

    def animal_params
      params.require(:animal).permit(:code, :name, :photo, :description, :female, :breed, :lot_id, :reproduction_id, :discard, :reason_discard, :user_id, :property_id, :donor)
    end
end
