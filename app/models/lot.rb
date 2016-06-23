class Lot < ActiveRecord::Base
  belongs_to :property
  
  validates :name, presence: true
  validates :description, presence: true
end
