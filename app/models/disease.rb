class Disease < ActiveRecord::Base
	has_many :illnesses, dependent: :destroy
end
