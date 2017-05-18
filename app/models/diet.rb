class Diet < ActiveRecord::Base

  has_paper_trail

  validates :amount, presence: true
  validates :datestart, presence: true
  validates :animal_id, presence: true
  validates :stock_id, presence: true
  
  belongs_to :animal
  belongs_to :stock

  def active?
  	self.dateend.nil?
  end
end
