class Animal < ActiveRecord::Base

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
    on_time.each do |t|
      on_date = Time.now - t.months
      data[t] = [on_date.strftime("%B/%Y"), self.average_month(on_date).to_f]
    end
    return data.reverse
  end

  def define_categories
    categories = []
    on_time = 0..11
    on_time.each do |t|
      on_date = Time.now - t.months
      categories[t] = on_date.strftime("%B/%Y")
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
    data = self.developments.map{|d| {height: d.height, created: d.created_at, weight: d.weight }}
    return data.reverse
  end

  def development_chart
    variable = {}
    variable['title'] = 'Title development'
    variable['subtitle'] = 'Subtitle development'
    variable['yAxis'] = ''
    variable['description'] = 'Desenvolvimento ao longo da vida'
    variable['categories'] = define_categories
    variable['data'] = animal_development
    return variable.to_json.html_safe
  end

end
