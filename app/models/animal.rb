class Animal < ActiveRecord::Base

  belongs_to :lot
  belongs_to :reproduction

  has_paper_trail

  has_many :animals, foreign_key: "mother_id", class_name: "Animal"
  has_many :animals, foreign_key: "father_id", class_name: "Animal"

  has_many :developments
  has_many :productions

  accepts_nested_attributes_for :developments, :productions, allow_destroy: true

  validates :code, presence: true
  validates :name, presence: true
  validates :breed, presence: true

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "30x30#" }, default_url: "/images/:style/missing_animal.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  crop_attached_file :photo

end
