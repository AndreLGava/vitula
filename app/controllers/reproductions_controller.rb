class ReproductionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reproduction, only: [:show, :edit, :update, :destroy]
  before_action :set_father, only: [:new, :edit, :update, :create]


  def new
    @mother = Animal.find(params[:mother_id])
    @reproduction = @mother.reproductions_as_mother.new
    @reproduction.animals.build
    @reproduction.financials.build
    if @mother.reproductions.empty?
      @p_heat = @mother.reproduction.born + 19.months  unless @mother.reproduction.nil?
    else
      @p_heat = @mother.reproductions.last.parturition + 21.days unless @mother.reproductions.last.parturition.nil?
    end
  end

  def edit
    @heat = @reproduction.heat
    @insemination = @reproduction.insemination
    @p_insemination = @heat + 1.day
    @p_stop_breastfeeding = @insemination + 214.days unless @insemination.nil?
    @p_parturition = @insemination + 274.days unless @insemination.nil?
  end

  def create
    @reproduction = Reproduction.new(reproduction_params)

    @animal = Animal.find_by_id(@reproduction.mother_id)

    @reproductions = @animal.reproductions.order(id: :desc).page params[:page]

    respond_to do |format|
      if @reproduction.save
        if @reproduction.parturition.nil?
          format.js { render 'reproduction', animal: @animal, reproductions: @reproductions }
        else
          format.js { render js: "window.location='#{new_animal_url(reproduction: @reproduction)}'" }
          #format.html { redirect_to new_animal_url(reproduction: @reproduction), notice: I18n.t('crud.saved') }
        end
      else
        format.js { render 'new' }
      end
    end
  end

  def update

    @animal = Animal.find_by_id(@reproduction.mother_id)

    @reproductions = @animal.reproductions.order(id: :desc).page params[:page]

    respond_to do |format|
      if @reproduction.update(reproduction_params)
        if @reproduction.parturition.nil?
          format.js { render 'reproduction', animal: @animal, reproductions: @reproductions }
        else
          format.js { render js: "window.location='#{new_animal_url(reproduction: @reproduction)}'" }
          #format.html { redirect_to new_animal_url(reproduction: @reproduction), notice: I18n.t('crud.saved') }
        end
      else
        format.js { render 'edit' }
      end
    end
  end

  private

    def set_reproduction
      @reproduction = Reproduction.find(params[:id])
      acesso(@reproduction.mother.user_id, root_path)
      @financials = @reproduction.financials
    end

    def set_father
      @father = Animal.where('female' => false, 'discard' => nil, user_id: current_user.id)
    end

    def reproduction_params
      params.require(:reproduction).permit(:heat, :insemination, :regress, :abortion, :stop_breastfeeding, :parturition, :mother_id, :father_id)
    end
end
