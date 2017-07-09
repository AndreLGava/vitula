class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	@stocks = Stock.where(bin_id: @current_user.bins.ids, glebe_id: nil, dateend: nil)
  	@production = Shipment.total(current_user, params[:page])
  	@parturition = Animal.parturition(current_user, Time.now.to_date)
  	@stop = Animal.stop(current_user, Time.now.to_date)
  	@financials = @financials = Financial.where(user_id: current_user.id, created_at: Time.now.to_date.beginning_of_month..Time.now.to_date.end_of_month)
  end
end
