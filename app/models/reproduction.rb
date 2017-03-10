class Reproduction < ActiveRecord::Base
  
  include ActionView::Helpers::DateHelper

  has_many :animals

  belongs_to :father, foreign_key: "father_id", class_name: "Animal"
  belongs_to :mother, foreign_key: "mother_id", class_name: "Animal"

  has_paper_trail

  validates :mother, presence: true
  validates :heat, presence: true

  @@first_heat = 19.moths #moths after her birth
  @@heat = 21.days #days after parturition or abortion
  @@insemiation = 18.hours #hours to success
  @@regress = @@heat #days after insemination or last heat
  @@stop_breastfeeding = 214.days #days after insemination 60 days before partturition
  @@parturition = 274.days #days +- 7 days [267 , 282] after last insemination

  def age
	  unless parturition.nil?
		  now = Time.now
		  parturit = parturition
		  distance_of_time_in_words(now, parturit, true)
		end
	end

  def first_heat
    animal_age = parturition + 15.months
    puts animal_age
    animal_age == Time.now
  end

  def find_heat
    animal_time = [regress , abortion , parturition].compact
    animal_time = animal_time[0] + 18.days
    puts animal_time
    animal_time == Time.now
  end

  def set_breast_feeding
    stopping_lactation = insemination + 214.days
    puts stopping_lactation
    stopping_lactation == Time.now
  end

  def set_parturition
    animal_parturition = insemination + 274.days
    puts animal_parturition
    animal_parturition == Time.now
  end

  def last_reproduction_active?
     return self.regress.nil? && self.abortion.nil? && self.parturition.nil? ? true : false
  end


end
