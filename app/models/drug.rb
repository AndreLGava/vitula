class Drug < ActiveRecord::Base
	has_many :treatments, dependent: :destroy
end
