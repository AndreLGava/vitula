class Feed < ActiveRecord::Base

	has_paper_trail

	validates :name, presence: true
	validates :kind, presence: true

	has_many :stocks, dependent: :destroy

	enum kind: {aditivos: 1, sal: 2, aleitamento: 3, volumoso: 4, concentrado: 5}
end
