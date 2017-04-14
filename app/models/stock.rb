class Stock < ActiveRecord::Base

  has_paper_trail

  validates :feed_id, presence: true
  validates :amount, presence: true
  validates :datestock, presence: true

  belongs_to :bin
  belongs_to :feed
  belongs_to :glebe

  def name
  	return "#{self.feed.name}"
  end
end
