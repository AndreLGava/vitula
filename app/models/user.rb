class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def user_params
		params.require(:user).permit(:name, :phone, :born, :cpf, :rg, :address, :city, :language)
	end
end
