class Stock < ActiveRecord::Base

  has_paper_trail

  include ActionView::Helpers::DateHelper
  require 'time'

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
  	return "Alimentos: #{self.feed.name} - #{self.bin.kind} - #{self.bin.capacity}"
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


  def spent
    @open = self.diets.where(dateend:nil)
    @closed = self.diets.where(" diets.dateend IS NOT NULL")

    openTotal = 0
    closedTotal = 0
    today = Time.now.to_date

    @open.each do |o|
      dias = (today - o.datestart.to_date + 1).to_i
      openTotal = dias * o.amount
    end

    @closed.each do |c|
      dias = (c.dateend.to_date - c.datestart.to_date + 1).to_i
      closedTotal = dias * c.amount
    end
    spent = (openTotal + closedTotal) / self.density
    return spent
  end

  def spent_kg
    kg = self.spent * self.density
    if kg > 1000
      kg = kg/1000
      resultado = "T"
    else
      resultado = "Kg"
    end

    return [kg, resultado]
  end

  def estimativa
    metro_cubico_capacidade = self.amount * 1000 / self.density
    resto_metro_cubico = metro_cubico_capacidade - self.spent
    consumo_dia = self.diets.where(dateend: nil).sum(:amount) * self.density / 10000
    if consumo_dia ==  0
        estimativa = 0
    else
      estimativa = (resto_metro_cubico / consumo_dia ).to_i < 0 ? 0 : (resto_metro_cubico / consumo_dia ).to_i
    end

    return estimativa
  end
end
