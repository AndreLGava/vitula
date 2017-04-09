class Drug < ActiveRecord::Base
	
	has_paper_trail

	has_many :treatments, dependent: :destroy
end
