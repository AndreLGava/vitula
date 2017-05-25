class Batchanimal < ActiveRecord::Base
  belongs_to :animal
  belongs_to :batch
end
