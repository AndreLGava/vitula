class Development < ActiveRecord::Base
  
  has_paper_trail

  belongs_to :animal

  validates :weight, presence: true
  validates :height, presence: true
  validates :animal, presence: true

end
