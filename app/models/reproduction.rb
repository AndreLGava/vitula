class Reproduction < ActiveRecord::Base
  belongs_to :father, class_name: "Animal"
  belongs_to :mother, class_name: "Animal"
# belongs_to :animal, :foreign_key => 'father_id'
#  belongs_to :animal, :foreign_key => 'mother_id'
end
