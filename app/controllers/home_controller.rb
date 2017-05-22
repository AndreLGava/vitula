class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  	@production = Shipment.total(current_user, params[:page])
  	@parturition = Animal.parturition(current_user, Time.now.to_date)
  	@stop = Animal.stop(current_user, Time.now.to_date)
  end
end
