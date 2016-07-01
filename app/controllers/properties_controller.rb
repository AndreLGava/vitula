class PropertiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_path, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_path, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:name, :description, :long, :lat, :user_id)
    end
end
