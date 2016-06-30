class Profile < ActiveRecord::Base
	has_paper_trail
	validates :name, presence: true
	validates :description, presence: true
end
