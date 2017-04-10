class Bin < ActiveRecord::Base
  belongs_to :property
  enum kind: {concreto: 1, metal: 2, madeira: 3, fibra: 4, plástico: 5}
end
