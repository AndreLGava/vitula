class Animal < ActiveRecord::Base
  belongs_to :lot
  belongs_to :reproduction

  has_many :mother, foreign_key: "mother_id", class_name: "Reproduction"
  has_many :father, foreign_key: "father_id", class_name: "Reproduction"

  validates :code, presence: true
  validates :name, presence: true
  validates :breed, presence: true
end
