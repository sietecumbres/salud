class Area < ActiveRecord::Base
  has_many :equipos
	belongs_to :laboratorio
	has_many :movimiento_insumos
	has_many :movimiento_equipos
end
