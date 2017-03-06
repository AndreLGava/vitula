class Glebe < ActiveRecord::Base

  belongs_to :property

  validates :name    , presence: true
  validates :area    , presence: true
  validates :property, presence: true

  has_paper_trail

  scope :them,   -> (property, params) { where(property_id: property.id).order(id: :desc).page params }
end
