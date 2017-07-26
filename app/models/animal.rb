# Animal is one of the most importnat class this is used to manage all the animals
class Animal < ActiveRecord::Base
  
  has_paper_trail

  # Animal must belong to a user and this can had a reproduction where we set a mother and his birth
  belongs_to :lot
  belongs_to :user
  belongs_to :reproduction
  belongs_to :property

  has_many :reproductions_as_father, class_name: 'Reproduction',  foreign_key: 'father_id'
  has_many :reproductions_as_mother, class_name: 'Reproduction',  foreign_key: 'mother_id'
  has_many :developments, dependent: :destroy
  has_many :productions, dependent: :destroy
  has_many :illnesses, dependent: :destroy
  has_many :diets, dependent: :destroy
  has_many :financials, dependent: :destroy

  validates :code, presence: true
  validates :name, presence: true
  validates :breed, presence: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "30x30#" }, default_url: "/images/:style/missing_animal.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  crop_attached_file :photo

  enum breed: {Holandes: 1, Jersey: 2, Gir: 3, Nelore: 4, Guzera: 5, Ayrshire: 6, Brahman: 7, Tabapua: 8, Sindi: 9, Angus: 9, Caracu: 10, Charoles: 11, Hereford: 12, Girolando: 13, Guernsey: 14, Normando: 15, Pitangueiras: 16, Red_Polled: 17, Simental: 18, Pinzguaer: 19}

  scope :pesquisa,      -> (params)               { where('"animals"."name" like ? ', "%#{params}%")}
  scope :animais,       -> (current_user, params) { select(:id, :code, :name, :breed, :description, :photo_file_name, :photo_content_type).where(user_id: current_user.id, discard: nil).where.not(donor: true).order(id: :desc).page params}
  scope :descartados,   -> (current_user)         { select(:id, :code, :name, :breed, :description, :photo_file_name, :photo_content_type).where("animals.user_id = ? and discard is not null", current_user.id).order(id: :desc)}
  scope :machos,        -> (current_user)         { where(female: false, discard: nil, user_id: current_user.id) }
  scope :femeas,        -> (current_user)         { where(female: true, discard: nil, user_id: current_user.id ) }
  scope :parturition,   -> (current_user, date)   { joins('INNER JOIN "reproductions" ON "reproductions"."mother_id" = "animals"."id"').where("reproductions.insemination between ? and ? and reproductions.abortion IS NULL and reproductions.regress IS NULL and reproductions.parturition IS NULL", date - 276.days, date.end_of_week + 267.days).where(discard: nil, user_id: current_user.id) }
  scope :stopped,       -> (current_user)         { joins('INNER JOIN "reproductions" ON "reproductions"."mother_id" = "animals"."id"').where("reproductions.abortion IS NULL and reproductions.regress IS NULL and reproductions.stop_breastfeeding IS NOT NULL and reproductions.parturition IS NULL ").where(discard: nil, user_id: current_user.id) }
  scope :stop,          -> (current_user, date)   { joins('INNER JOIN "reproductions" ON "reproductions"."mother_id" = "animals"."id"').where("reproductions.insemination between ? and ? and reproductions.abortion IS NULL and reproductions.regress IS NULL", date.beginning_of_week - 214.days, date.end_of_week - 214.days).where(discard: nil, user_id: current_user.id) }
  scope :heat,          -> (current_user, date)   { joins('INNER JOIN "reproductions" ON "reproductions"."mother_id" = "animals"."id"').where("reproductions.insemination = ? and reproductions.abortion IS NULL and reproductions.regress IS NULL", date ).where(discard: nil, user_id: current_user.id) }


  def is_adult?
    if self.reproduction.nil?
      true
    else
      born = self.reproduction.parturition
      today = Time.now.to_date - 19.months
      today < born ? true : false    
    end
  end

  def reproductions
    Reproduction.where('mother_id = ? or father_id = ?', id, id)
  end

  def average_month(date)
    all_of_them = self.productions.where('measurement >= ? and measurement <= ?', date.beginning_of_month, date.end_of_month)
    return all_of_them.empty? ? 0 : all_of_them.average(:amount).round(2)
  end

  def average_year_total(date)
    all_of_them = self.productions.where('measurement >= ? and measurement <= ?', date.beginning_of_year, date.end_of_year)
    return all_of_them.empty? ? 0 : (all_of_them.sum(:amount)/12).round(2)
  end

  def average_year
    data = []
    on_time = 0..11
    on_time.each do |time|
      on_date = Time.now - time.months
      data[time] = [on_date.strftime("%B/%Y"), self.average_month(on_date).to_f]
    end
    return data.reverse
  end

  def define_categories
    categories = []
    on_time = 0..11
    on_time.each do |time|
      on_date = Time.now - time.months
      categories[time] = on_date.strftime("%B/%Y")
    end
    return categories.reverse
  end

  def production_chart
    variable = {}
    variable['title']                      = I18n.t('productions.chart.title')
    variable['subtitle']                   = I18n.t('productions.chart.subtitle')
    variable['yAxis']                      = I18n.t('productions.chart.yaxis')
    variable['description']                = I18n.t('productions.chart.description')
    variable['categories']                 = define_categories
    variable['data']                       = average_year
    return variable.to_json.html_safe
  end

  def animal_development
    development = {}
    development['created']                 = self.developments.select(:created_at).map(&:created_at).map(&:to_date).map(&:to_s).reverse
    development['height']                  = self.developments.select(:height).map(&:height).map(&:to_f).reverse
    development['weight']                  = self.developments.select(:weight).map(&:weight).map(&:to_f).reverse
    return development
  end

  def development_chart
    variable = {}
    variable['title']                      = I18n.t('developments.chart.title')
    variable['subtitle']                   = I18n.t('developments.chart.subtitle')
    variable['yAxis']                      = I18n.t('developments.chart.yaxis')
    variable['description']                = I18n.t('developments.chart.description')
    variable['categories']                 = nil
    variable['data']                       = animal_development
    return variable.to_json.html_safe 
  end

  def can_reproduce?
    animal = self
    if animal.female?
      if animal.is_adult?
        if animal.reproductions.empty?
          true
        else
          if animal.reproductions.last.last_reproduction_active?
            false
          else
            true
          end
        end
      else
        false
      end
    else
      false
    end
  end
end