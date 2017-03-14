class Treatment < ActiveRecord::Base
  belongs_to :illness
  belongs_to :drug
end
