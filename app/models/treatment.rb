class Treatment < ActiveRecord::Base
  belongs_to :illness
  belongs_to :drug

  validates :illness, presence: true
  validates :drug, presence: true
  validates :startdate, presence: true
  validates :dosage, presence: true
end
