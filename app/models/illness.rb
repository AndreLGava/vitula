class Illness < ActiveRecord::Base

  has_paper_trail
  
  has_many :treatments

  belongs_to :animal
  belongs_to :disease
   
end
