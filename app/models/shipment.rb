class Shipment < ActiveRecord::Base

    has_paper_trail

	validates :amount       , presence: true
	validates :date         , presence: true
	validates :property_id  , presence: true

	belongs_to :property

	scope :them,   -> (property, params) { where(property_id: property.id).order(id: :desc).page params }
	
end
