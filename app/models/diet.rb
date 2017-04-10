class Diet < ActiveRecord::Base
  belongs_to :animal
  belongs_to :stock
end
