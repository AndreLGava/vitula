class Animal < ActiveRecord::Base
  belongs_to :lot
  belongs_to :reproduction

  has_many :reproduction, as: :mother_id, through: :animal
  has_many :reproduction, as: :father_id, through: :animal
end
