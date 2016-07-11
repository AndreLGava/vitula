class Production < ActiveRecord::Base
  belongs_to :animal

  validates :amount, presence: true

end
