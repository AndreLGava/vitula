class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	@production = Shipment.total(current_user, params[:page])
  	@parturition = Animal.parturition(current_user, Time.now.to_date)
  	@stop = Animal.stop(current_user, Time.now.to_date)
  	@financials = @financials = Financial.where(user_id: current_user.id, created_at: Time.now.to_date.beginning_of_month..Time.now.to_date.end_of_month)
  end
end
