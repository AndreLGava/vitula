class Property < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
