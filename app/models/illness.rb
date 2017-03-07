class Illness < ActiveRecord::Base
  belongs_to :animal
  belongs_to :disease
  belongs_to :treatment
end
