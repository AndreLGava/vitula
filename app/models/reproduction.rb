class Reproduction < ActiveRecord::Base
  belongs_to :father, class_name: "Animal"
  belongs_to :mother, class_name: "Animal"

  validates :mother, presence: true
  validates :heat, presence: true
end
