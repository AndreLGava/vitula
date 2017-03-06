class Property < ActiveRecord::Base

  has_paper_trail

  validates :name       , presence: true
  validates :description, presence: true
  validates :user_id    , presence: true
  validates :area       , presence: true

end
