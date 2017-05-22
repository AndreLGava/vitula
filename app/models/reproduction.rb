class Reproduction < ActiveRecord::Base
 
  has_paper_trail
  
  include ActionView::Helpers::DateHelper

  has_many :animals

  belongs_to :father, foreign_key: "father_id", class_name: "Animal"
  belongs_to :mother, foreign_key: "mother_id", class_name: "Animal"

  validates :mother, presence: true
  validates :heat, presence: true
  validate  :is_father?
  validate  :insemination?
  validate  :parturition?
  validate  :first_reproduction?, on: :create
  validate  :can_reproduce?, on: :create


  @@first_heat = 19.months #moths after her birth
  @@heat = 21.days #days after parturition or abortion
  @@insemiation = 18.hours #hours to success
  @@regress = @@heat #days after insemination or last heat
  @@stop_breastfeeding = 214.days #days after insemination 60 days before partturition
  @@parturition = 274.days #days +- 7 days [267 , 282] after last insemination

  def can_reproduce?
    unless Animal.find(self.mother_id).reproduction.empty?
      born = Animal.find(self.mother_id).reproduction
      binding.pry
      if born.age < 19.months
        errors.add(:insemination, I18n.t('activerecord.models.born'))
      end
    end
  end

  def parturition?
    if self.insemination.nil? and self.parturition.nil?
      days_aftera = self.insemination + 6.months
      days_afterb = self.insemination + 10.months
      binding.pry

      if self.parturition < days_aftera or self.parturition > days_afterb
        errors.add(:parturition, I18n.t('activerecord.models.parturition'))
      end
    end
  end

  def insemination?
    days_after = self.heat + 2.days unless self.heat.nil?
    unless self.insemination.nil?
      if self.insemination > days_after 
        errors.add(:insemination, I18n.t('activerecord.models.insemination'))
      end
    end
  end

  def first_reproduction?
    unless Animal.find(self.mother_id).reproductions.empty?
      reproduction = Animal.find(self.mother_id).reproductions.last
      unless reproduction.parturition.nil?
        if self.heat < reproduction.parturition
          errors.add(:heat, I18n.t('activerecord.models.heat'))
        end
      end
    end
  end

  def age
	  unless parturition.nil?
		  now = Time.now.to_datetime
		  parturit = self.parturition.to_datetime
		  distance_of_time_in_words(now, parturit, true)
		end
	end

  def born
    unless parturition.nil?
      parturition
    end
  end

  def last_reproduction_active?
     return self.regress.nil? && self.abortion.nil? && self.parturition.nil? ? true : false
  end

  def is_father?
    @father     = self.father_id
    @mother     = Animal.find(self.mother_id)
    @her_father = @mother.reproduction.father_id unless @mother.reproduction.nil?
    errors.add(:father, I18n.t('activerecord.models.is_father')) unless @father != @her_father
  end
end
