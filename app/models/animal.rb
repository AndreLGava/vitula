class Animal < ActiveRecord::Base
  belongs_to :lot
  belongs_to :reproduction
end
