class Animal < ActiveRecord::Base
  belongs_to :lot
  belongs_to :reproduction

  has_many :animals, foreign_key: "mother_id", class_name: "Animal"
  has_many :animals, foreign_key: "father_id", class_name: "Animal"
end
