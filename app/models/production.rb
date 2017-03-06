class Production < ActiveRecord::Base
  belongs_to :animal

  has_paper_trail
  
  validates :amount, presence: true


end
