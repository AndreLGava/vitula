class Bin < ActiveRecord::Base

  has_paper_trail

  validates :capacity, presence: true
  validates :property_id, presence: true
  validates :kind, presence: true

  belongs_to :property

  has_many :stocks, dependent: :destroy

  enum kind: {concreto: 1, metal: 2, madeira: 3, fibra: 4, plástico: 5}

  def name
  	return "#{self.kind} - #{self.capacity} M³"
  end
end
