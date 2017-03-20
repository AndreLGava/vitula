class Illness < ActiveRecord::Base
  
  has_many :treatments

  belongs_to :animal
  belongs_to :disease
end
