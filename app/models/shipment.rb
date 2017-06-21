class Shipment < ActiveRecord::Base

    has_paper_trail

	validates :amount       , presence: true
	validates_length_of :amount       , minimum: 1
	validates :date         , presence: true
	validates :property_id  , presence: true

	belongs_to :property
	belongs_to :financial

	scope :them,   -> (user, params) { where(property_id: user.properties.ids).order(id: :desc).page params }
	scope :total,   -> (user, params) { where(property_id: user.properties.ids, date: Time.now.beginning_of_month..Time.now.end_of_month).order(id: :desc).page params }
	scope :shipment,   -> (user, datestart, dateend) { where(property_id: user.properties.ids, date: datestart..dateend, financial_id: nil).order(id: :desc)}
	scope :total_general,   -> (user, date) { where(property_id: user.properties.ids, date: date.beginning_of_month..date.end_of_month)}
	
	def total_last_month(user)
		total = Shipment.total_general(user, Time.now - 1.month)
		return total.sum(:amount)
	end

	def name
	  return "Venda de leite: #{self.amount}"
	end
end
