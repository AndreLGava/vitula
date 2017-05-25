class Stock < ActiveRecord::Base

  has_paper_trail

  validates :feed_id, presence: true
  validates :amount, presence: true
  validates :datestock, presence: true
  validates :density, presence: true

  belongs_to :bin
  belongs_to :feed
  belongs_to :glebe

  has_many :diets, dependent: :destroy
  has_many :financials, dependent: :destroy

  def name
  	return "#{self.feed.name}"
  end

  def inactive?
  	self.dateend.nil?
  end

  def validate_amount
    @density     = self.density * 1000
    @amount      = self.amount
    @bin         = Bin.find(self.bin_id)

    total = @amount/@densidade

    errors.add(:amount, I18n.t('activerecord.models.amount_invalid')) if total > @bin.capacity
  end
end
