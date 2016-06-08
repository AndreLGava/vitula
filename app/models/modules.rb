class Modules < ActiveRecord::Base
  	def user_params
		params.require(:modules).permit(:code, :name, :description)
	end
end
