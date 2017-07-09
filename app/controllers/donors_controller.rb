class DonorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal, only: [:show, :edit, :update]

  def index
    @donors = Animal.where(donor: true, user_id: @current_user.id, discard: nil)
  end

  def show
  end

  def new
    @donor = Animal.new
  end

  def edit
  end

   private
    def set_animal
      @donor = Animal.find(params[:id])
      acesso(@donor.user_id, donors_path)
    end

    def animal_params
      params.require(:animal).permit(:code, :name, :photo, :description, :female, :breed, :discard, :user_id, :donor)
    end
end
