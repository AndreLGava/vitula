
class User < ActiveRecord::Base

  has_paper_trail
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "30x30#" }, default_url: "/images/:style/missing_user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :properties, dependent: :destroy
  has_many :shipments, through: :properties
  has_many :analyses, through: :properties
  has_many :employees, through: :properties
  has_many :services, through: :properties
  has_many :animals, dependent: :destroy
  has_many :bins, through: :properties
  has_many :stocks, through: :bins
  has_many :glebes, through: :properties

  def has_property?
    self.properties.empty? ? false : true
  end

  def has_bin?
    self.bins.empty? ? false : true
  end

  def has_animals?
    self.animals.empty? ? false : true
  end

  def has_disease?
    Disease.all.empty? ? false : true
  end

  def has_stock?
    self.stocks.empty? ? false : true
  end

  def user_params
		params.require(:user).permit(:name, :avatar, :phone, :born, :cpf, :rg, :address, :city, :language)
	end


  def set_data_shipment
    @today = Time.now.to_date
    @end_of_year = @today-1.year
    shipment = {}
    shipment['date']                       = self.shipments.where(date: @end_of_year..@today).order(date: :ASC).map(&:date).map(&:to_date).map(&:to_s)
    shipment['amount']                     = self.shipments.where(date: @end_of_year..@today).order(date: :ASC).map(&:amount).map(&:to_f)
    return shipment
  end

  def shipments_chart
    variable = {}
    variable['title']                      = I18n.t('shipments.chart.title')
    variable['subtitle']                   = I18n.t('shipments.chart.subtitle')
    variable['yAxis']                      = I18n.t('shipments.chart.yaxis')
    variable['description']                = I18n.t('shipments.chart.description')
    variable['categories']                 = nil
    variable['data']                       = set_data_shipment
    return variable.to_json.html_safe 
  end

  def set_data_analyses
    @today = Time.now.to_date
    @end_of_year = @today-1.year
    analysis = {}
    analysis['collect']                    = self.analyses.where(collect: @end_of_year..@today).map(&:collect).map(&:to_s)
    analysis['fat']                        = self.analyses.where(collect: @end_of_year..@today).map(&:fat).map(&:to_f)
    analysis['protein']                    = self.analyses.where(collect: @end_of_year..@today).map(&:protein).map(&:to_f)
    analysis['lactose']                    = self.analyses.where(collect: @end_of_year..@today).map(&:lactose).map(&:to_f)
    analysis['totalsolids']                = self.analyses.where(collect: @end_of_year..@today).map(&:totalsolids).map(&:to_f)
    analysis['defattedextract']            = self.analyses.where(collect: @end_of_year..@today).map(&:defattedextract).map(&:to_f)
    analysis['css']                        = self.analyses.where(collect: @end_of_year..@today).map(&:css).map(&:to_f)
    analysis['scorecss']                   = self.analyses.where(collect: @end_of_year..@today).map(&:scorecss).map(&:to_f)
    analysis['ufc']                        = self.analyses.where(collect: @end_of_year..@today).map(&:ufc).map(&:to_f)
    return analysis
  end

  def analyses_chart
    variable = {}
    variable['title']                      = I18n.t('analyses.chart.title')
    variable['subtitle']                   = I18n.t('analyses.chart.subtitle')
    variable['yAxis']                      = I18n.t('analyses.chart.yaxis')
    variable['description']                = I18n.t('analyses.chart.description')
    variable['categories']                 = nil
    variable['data']                       = set_data_analyses
    return variable.to_json.html_safe 
  end
  
end
