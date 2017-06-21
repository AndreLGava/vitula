class Financial < ActiveRecord::Base

  belongs_to :animal
  belongs_to :service
  belongs_to :employee
  belongs_to :reproduction
  belongs_to :stock
  belongs_to :treatment
  belongs_to :schedule
  
  has_many :shipments

  enum operation: {debito: 0, credito: 1}

  validates :description, presence: true
  validates :value, presence: true

  def name
  	"#{self.description}"
  end

  def nature
    case self
      when !self.animal_id.nil?
        nature = self.animal
      when !self.service_id.nil?
        nature = self.service
      when !self.employee_id.nil?
        nature = self.employee
      when !self.reproduction_id.nil?
        nature = self.reproduction
      when !self.stock_id.nil?
        nature = self.stock
      when !self.treatment_id.nil?
        nature = self.treatment
      when !self.shipment_id.nil?
        nature = self.shipment
      when !self.schedule_id.nil?
        nature = self.schedule
      end
  end

  def model?
      case self
      when !self.animal_id.nil?
        return  "animal"
      when !self.service_id.nil?
        return  "service"
      when !self.employee_id.nil?
        return  "employee"
      when !self.reproduction_id.nil?
        return  "reproduction"
      when !self.stock_id.nil?
        return  "stock"
      when !self.treatment_id.nil?
        return  "treatment"
      when !self.shipment_id.nil?
        return  "shipment"
      when !self.schedule_id.nil?
        return  "schedule"
      end
  end
end
