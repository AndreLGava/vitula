class PropertiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.where(user_id: current_user.id).page params[:page]
  end

  def show
  end

  def new
    @property = Property.new
    @property.glebes.build
    @property.employees.build
  end

  def edit
  end

  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_path, notice: I18n.t('crud.saved') }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_path, notice: I18n.t('crud.saved') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: I18n.t('crud.destroyed') }
    end
  end

  def property_glebes
    @property = Property.find(params[:id])
    @glebes   = Glebe.them(@property, params[:page])
  end
  
  def property_employees
    @property = Property.find(params[:id])
    @employees= Employee.them(@property, params[:page])
  end

  private
    def set_property
      @property = Property.find(params[:id])
      acesso(@property.user_id, root_path)
    end

    def property_params
      params.require(:property).permit(:name, :description, :long, :lat,:area,:altitude,:precipitation,:enrolement_od_sanity,:nirf,:incra,:state_registration,:manager, :user_id)
    end
end
