class Reproduction < ActiveRecord::Base
 
  has_paper_trail
  
  include ActionView::Helpers::DateHelper
  require 'time'

  has_many :animals

  belongs_to :father, foreign_key: "father_id", class_name: "Animal"
  belongs_to :mother, foreign_key: "mother_id", class_name: "Animal"

  validates :mother, presence: true
  validates :heat, presence: true
  validate  :is_father?
  validate  :age_of_reproduction, on: :create
  validate  :is_active?, on: :create
  validate  :parturition?
  validate  :insemination?

  @@first_heat = 19.months #moths after her birth
  @@heat = 21.days #days after parturition or abortion
  @@insemiation = 18.hours #hours to success
  @@regress = @@heat #days after insemination or last heat
  @@stop_breastfeeding = 214.days #days after insemination 60 days before partturition
  @@parturition = 274.days #days +- 7 days [267 , 282] after last insemination

  def age_of_reproduction
    animal = Animal.find(self.mother_id)
    errors.add(:insemination, I18n.t('activerecord.models.born')) unless animal.is_adult?
  end

  def  is_active?
    animal = Animal.find(self.mother_id)
    unless animal.reproductions.empty?
      errors.add(:insemination, I18n.t('activerecord.models.reproduction_false')) if animal.reproductions.last.last_reproduction_active?
    end
  end

  def reproduction?
    animal = Animal.find(self.mother_id)
    if animal.is_adult?
      if animal.reproductions.empty?
        true
      else
        if animal.reproductions.last.last_reproduction_active?
          errors.add(:insemination, I18n.t('activerecord.models.reproduction_false'))
        else
          true
        end
      end
    else
      errors.add(:insemination, I18n.t('activerecord.models.born'))
    end
  end

  def percent
    if self.insemination.nil?
      return 0
    else
      insemination = self.insemination
      today = Time.now.to_date
      dias = today - insemination
      valor = ((100*dias)/274).to_i
      return  valor < 100 ? valor : 100 
    end
  end

  def can_reproduce?
    animal = Animal.find(self.mother_id)
    unless animal.reproduction.nil?
     animal.is_adult? ? true : errors.add(:insemination, I18n.t('activerecord.models.born'))
    end
  end

  def parturition?
    unless self.parturition.nil?
      days_aftera = self.insemination + 6.months
      days_afterb = self.insemination + 10.months

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
    if self.regress.nil? 
      if self.abortion.nil?
        if self.parturition.nil? 
          true
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

  def is_father?
    @father     = self.father_id
    @mother     = Animal.find(self.mother_id)
    @her_father = @mother.reproduction.father_id unless @mother.reproduction.nil?
    errors.add(:father, I18n.t('activerecord.models.is_father')) unless @father != @her_father
  end
end
