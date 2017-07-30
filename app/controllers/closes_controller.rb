class ClosesController < ApplicationController
  before_action :authenticate_user!

  def index
    @closes = Close.where(user_id: current_user.id).order(dateclosing: :DESC).page params[:page]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_close
      @close = Close.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def close_params
      params.require(:close).permit(:dateclosing, :totalvalue)
    end
end
