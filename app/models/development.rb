class Development < ActiveRecord::Base
  
  has_paper_trail

  belongs_to :animal

  validates :weight, presence: true
  validates :height, presence: true
  validates :animal, presence: true

  def graph
    hash = {}
    hash['title'] =  'Teste'
    hash['subtitle'] = 'subtitulo'
    hash = data(hash)
    hash.to_json.html_safe
  end

  def data(hash)
    hash['weight'] = []
    hash['height'] = []
    hash['time'] = []
  end

end
