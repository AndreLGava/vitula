class Reproduction < ActiveRecord::Base

  belongs_to :father, foreign_key: "father_id", class_name: "Animal"
  belongs_to :mother, foreign_key: "mother_id", class_name: "Animal"

  has_paper_trail

  validates :mother, presence: true
  validates :heat, presence: true
end
