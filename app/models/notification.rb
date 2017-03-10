class Notification < ActiveRecord::Base
  belongs_to :user

  has_paper_trail
  ########################################Variables###################################################
  @login = Time.now.to_date - 90.days
  @heat  = Time.now - Reproduction.class_variable_get(:@@heat) + 7.days

  ########################################Methods###################################################

  def self.create(notification_params)
    @notification = Notification.new(notification_params)
    @notification.save
  end

  def verify_heat
  	@users = User.all.where(last_sign_in_at: @login )

  	@users.each do |user|
  		@animals = Animal.parturition(user, )

  	end
  	Notification.create(title: "Mocha" , description: "Laranja precisa ser desverminada", limit: limit, user_id: 1)
  end
  
end
