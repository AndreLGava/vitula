class Glebe < ActiveRecord::Base

  belongs_to :property

  validates :name    , presence: true
  validates :area    , presence: true
  validates :property, presence: true

  has_paper_trail

  enum purpose: {Plantio: 1, Pastejo: 2, Construção: 3}

  scope :them,   -> (property, params) { where(property_id: property.id).order(id: :desc).page params }

  belongs_to :property

end
