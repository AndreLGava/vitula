class Service < ActiveRecord::Base

  has_paper_trail

  belongs_to :property

  has_many :financials, dependent: :destroy

  def name
  	return "Serviço: #{self.provider} - #{self.goal}"  	
  end
end
