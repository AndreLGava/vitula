class Glebe < ActiveRecord::Base

  has_paper_trail
  
  belongs_to :property

  validates :name          , presence: true
  validates :area          , presence: true 
  validates :property      , presence: true
  validate  :validate_glebe
  validate  :validate_area

  enum purpose: {Plantio: 1, Pastejo: 2, Construção: 3}

  scope :them,   -> (property, params) { where(property_id: property.id).order(id: :desc).page params }

  belongs_to :property
  
  def validate_glebe
  	@property = Property.find(self.property_id)
  	@glebes   = @property.glebes.where(inactive: false).where.not(id: self.id).sum(:area)
  	@total    = @glebes + self.area
		errors.add(:area, I18n.t('activerecord.models.glebe_invalid')) unless @total <= @property.area
  end

  def validate_area
    @area     = self.area
    errors.add(:area, I18n.t('activerecord.models.area_invalid')) if @area < 0.1
  end

  def active?
    return "danger" if self.inactive == true 
  end
end
