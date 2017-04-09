class Analysis < ActiveRecord::Base

  validates :property_id        , presence: true 
  validates :codeanalysis       , presence: true 
  validates :collect            , presence: true 
  validates :fat                , presence: true 
  validates :protein            , presence: true 
  validates :lactose            , presence: true 
  validates :css                , presence: true 
  validates :ufc                , presence: true 

  belongs_to :property

  scope :them,   -> (user, params) { where(property_id: user.properties.ids).order(id: :desc).page params }

end
