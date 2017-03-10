class Notification < ActiveRecord::Base
  belongs_to :user

  has_paper_trail
  ########################################Variables###################################################
  @login = Time.now.to_date - 90.days
  @limit = Time.now + 30.days
  @heat  = Time.now - Reproduction.class_variable_get(:@@heat) + 7.days

  ########################################Methods###################################################

  def self.create(notification_params)
    @notification = Notification.new(notification_params)
    @notification.save
  end

  def verify_heat
  	@users = User.all.where(last_sign_in_at: @login )

  	@users.each do |user|
  		@animals = Animal.parturition(user, @heat)

  		@animals.each do |animal|
  			Notification.create(title: "Descrição da notificação" , description: "O animal deverá entrar em cio em aproximadamente 7 dias, fique atento aos sinais", limit: @limit, user_id: user.id)
  		end
  	end
  end
  
end
