class Lot < ActiveRecord::Base
  belongs_to :property

  has_paper_trail

  validates :name, presence: true
  validates :description, presence: true
end
