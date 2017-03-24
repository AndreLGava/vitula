class Shipment < ActiveRecord::Base

    has_paper_trail

	validates :amount       , presence: true
	validates :date         , presence: true
	validates :property_id  , presence: true

	belongs_to :property
end
