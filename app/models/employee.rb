class Employee < ActiveRecord::Base

  belongs_to :property

  enum schooling: {primario: 1, fundamental: 2, medio: 3, graduacao: 4, posgraduacao: 5}
  enum payment: {regular: 1, esporadicamente: 2}
end
