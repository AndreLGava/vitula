class Disease < ActiveRecord::Base

	has_paper_trail
	
	has_many :illnesses, dependent: :destroy
end
