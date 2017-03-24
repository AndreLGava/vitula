class Glebe < ActiveRecord::Base

  has_paper_trail
  
  belongs_to :property

  validates :name          , presence: true
  validates :area          , presence: true 
  validates :property      , presence: true
  validate  :validate_glebe

  enum purpose: {Plantio: 1, Pastejo: 2, Construção: 3}

  scope :them,   -> (property, params) { where(property_id: property.id).order(id: :desc).page params }

  belongs_to :property
  
  def validate_glebe
  	@property = Property.find(self.property_id)
  	@glebes   = @property.glebes.where(inactive: false).sum(:area)
  	@total    = @glebes + self.area
		errors.add(:area, I18n.t('activerecord.models.glebe_invalid')) unless @total <= @property.area
  end
end
