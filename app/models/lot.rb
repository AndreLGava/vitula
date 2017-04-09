class Lot < ActiveRecord::Base

  has_paper_trail

  belongs_to :property

  validates :name, presence: true
  validates :description, presence: true
end
