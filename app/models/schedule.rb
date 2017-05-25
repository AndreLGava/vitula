class Schedule < ActiveRecord::Base

  has_paper_trail

  belongs_to :event
  belongs_to :batch

  has_many :financials, dependent: :destroy

  def name
  	"#{self.event.name} - #{self.datestart} - #{self.dateend}"
  end
  
end
