class Development < ActiveRecord::Base
  belongs_to :animal

  validates :weight, presence: true
  validates :height, presence: true

  def development_graph
    
  end

end
