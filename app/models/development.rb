class Development < ActiveRecord::Base
  belongs_to :animal

  validates :weight, presence: true
  validates :height, presence: true

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
