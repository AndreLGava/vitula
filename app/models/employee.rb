class Employee < ActiveRecord::Base

  has_paper_trail

  belongs_to :property

  has_many :financials, dependent: :destroy

  enum schooling: {primario: 1, fundamental: 2, medio: 3, graduacao: 4, posgraduacao: 5}
  enum payment: {regular: 1, esporadicamente: 2}

  scope :them,   -> (property, params) { where(property_id: property).order(id: :desc).page params }
end
