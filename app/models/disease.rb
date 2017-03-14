class Disease < ActiveRecord::Base
	has_many :treatments, dependent: :destroy
end
