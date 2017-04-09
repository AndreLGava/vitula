
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
  has_many :animals, dependent: :destroy


  def user_params
		params.require(:user).permit(:name, :avatar, :phone, :born, :cpf, :rg, :address, :city, :language)
	end


  def set_data
    analysis = {}
    analysis['collect']                = self.analyses.map(&:collect).map(&:to_s).reverse
    analysis['fat']                    = self.analyses.map(&:fat).map(&:to_i).reverse
    analysis['protein']                = self.analyses.map(&:protein).map(&:to_i).reverse
    analysis['lactose']                = self.analyses.map(&:lactose).map(&:to_i).reverse
    analysis['totalsolids']            = self.analyses.map(&:totalsolids).map(&:to_i).reverse
    analysis['defattedextract']        = self.analyses.map(&:defattedextract).map(&:to_i).reverse
    analysis['css']                    = self.analyses.map(&:css).map(&:to_i).reverse
    analysis['scorecss']               = self.analyses.map(&:scorecss).map(&:to_i).reverse
    analysis['ufc']                    = self.analyses.map(&:ufc).map(&:to_i).reverse
    return analysis
  end

  def chart
    variable = {}
    variable['title']                      = I18n.t('analyses.chart.title')
    variable['subtitle']                   = I18n.t('analyses.chart.subtitle')
    variable['yAxis']                      = I18n.t('analyses.chart.yaxis')
    variable['description']                = I18n.t('analyses.chart.description')
    variable['categories']                 = nil
    variable['data']                       = set_data
    return variable.to_json.html_safe 
  end
  
end
