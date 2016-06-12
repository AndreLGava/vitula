class Permission < ActiveRecord::Base
  belongs_to :modulo
  belongs_to :functionality
end
