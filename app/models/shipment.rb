class Shipment < ActiveRecord::Base

    has_paper_trail

	validates :amount       , presence: true
	validates :date         , presence: true
	validates :property_id  , presence: true

	belongs_to :property

	scope :them,   -> (user, params) { where(property_id: user.properties.ids).order(id: :desc).page params }
	
end
