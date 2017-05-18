class Property < ActiveRecord::Base

  has_paper_trail

  validates :name       , presence: true
  validates :description, presence: true
  validates :user_id    , presence: true
  validates :area       , presence: true

  has_many :glebes      , dependent: :destroy 
  has_many :employees   , dependent: :destroy 
  has_many :animals     , dependent: :destroy 
  has_many :shipments   , dependent: :destroy 
  has_many :analyses    , dependent: :destroy 
  has_many :bins        , dependent: :destroy 

end
