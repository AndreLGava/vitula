class Production < ActiveRecord::Base
  
  has_paper_trail
  
  belongs_to :animal
  
  validates :amount, presence: true


end
