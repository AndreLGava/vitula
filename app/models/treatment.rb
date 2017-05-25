class Treatment < ActiveRecord::Base

  has_paper_trail

  belongs_to :illness
  belongs_to :drug

  has_many :financials, dependent: :destroy

  validates :illness, presence: true
  validates :drug, presence: true
  validates :startdate, presence: true
  validates :dosage, presence: true
  
end
