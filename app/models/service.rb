class Service < ActiveRecord::Base

  has_paper_trail

  belongs_to :property

  has_many :financials, dependent: :destroy
end
