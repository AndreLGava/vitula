class Lots < ActiveRecord::Base
  enum lots: [ terneiros: 1, novilhos_abate: 2, novilhas: 3, vacas_lactantes: 4, vacas_secas: 5, reprodutores: 6 ]
end
