class Stock < ActiveRecord::Base
  belongs_to :bin
  belongs_to :feed
  belongs_to :glebe
end
