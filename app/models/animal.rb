class Animal < ActiveRecord::Base

  belongs_to :lot
  belongs_to :user
  belongs_to :reproduction

  has_many :reproductions_as_father, class_name: 'Reproduction',  foreign_key: 'father_id'
  has_many :reproductions_as_mother, class_name: 'Reproduction',  foreign_key: 'mother_id'
  has_many :developments, dependent: :destroy
  has_many :productions, dependent: :destroy

  accepts_nested_attributes_for :developments, :productions, allow_destroy: true

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

end
