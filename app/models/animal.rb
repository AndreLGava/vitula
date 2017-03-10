# Animal is one of the most importnat class this is used to manage all the animals
class Animal < ActiveRecord::Base
  # Animal must belong to a user and this can had a reproduction where we set a mother and his birth
  belongs_to :lot
  belongs_to :user
  belongs_to :reproduction

  has_many :reproductions_as_father, class_name: 'Reproduction',  foreign_key: 'father_id'
  has_many :reproductions_as_mother, class_name: 'Reproduction',  foreign_key: 'mother_id'
  has_many :developments, dependent: :destroy
  has_many :productions, dependent: :destroy

  has_paper_trail

  validates :code, presence: true
  validates :name, presence: true
  validates :breed, presence: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "30x30#" }, default_url: "/images/:style/missing_animal.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  crop_attached_file :photo

  enum breed: {Holandez: 1, Jersey: 2, Gir: 3, Nelore: 4}

  scope :animais,  -> (current_user, params) {select(:id, :code, :name, :breed, :description, :photo_file_name, :photo_content_type).where(user_id: current_user.id, discard: nil).order(:lot_id, :name).page params}
  scope :machos,   -> (current_user)         { where(female: false, discard: nil, user_id: current_user.id) }
  scope :femeas,   -> (current_user)         { where(female: true, discard: nil, user_id: current_user.id ) }
  scope :parturition,   -> (current_user, date)   { joins('INNER JOIN "reproductions" ON "reproductions"."mother_id" = "animals"."id"').where("reproductions.insemination = ? and reproductions.abortion IS NULL and reproductions.regress IS NULL", date ).where(discard: nil, user_id: current_user.id) }


  def reproductions
    Reproduction.where('mother_id = ? or father_id = ?', id, id)
  end

  def average_month(date)
    all_of_them = self.productions.where('measurement >= ? and measurement <= ?', date.beginning_of_month, date.end_of_month)
    return all_of_them.empty? ? 0 : all_of_them.average(:amount)
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
    variable['title'] = 'Title'
    variable['subtitle'] = 'Subtitle'
    variable['yAxis'] = 'Produção'
    variable['description'] = 'Produção ao longo dos meses'
    variable['categories'] = define_categories
    variable['data'] = average_year
    return variable.to_json.html_safe
  end

  def animal_development
    development = {}
    development['created'] = self.developments.select(:created_at).map(&:created_at).map(&:to_s).uniq
    development['height'] = self.developments.select(:height).map(&:height).uniq
    development['weight'] = self.developments.select(:weight).map(&:weight).uniq
    return development
  end

  def development_chart
    variable = {}
    variable['title'] = 'Title development'
    variable['subtitle'] = 'Subtitle development'
    variable['yAxis'] = ''
    variable['description'] = 'Desenvolvimento ao longo da vida'
    variable['categories'] = nil
    variable['data'] = animal_development
    return variable.to_json.html_safe
  end

  def can_reproduce?
    if !self.reproductions.nil?
      return true
    elsif self.discard.nil? && self.female == true && !self.reproductions.last.last_reproduction_active?
      return true
    else
      return false
    end
  end
end