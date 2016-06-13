class Functionality < ActiveRecord::Base

  validates :name, presence: true
  validates :modulo, presence: true

  belongs_to :modulo
end
