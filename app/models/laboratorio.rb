class Laboratorio < ActiveRecord::Base
	has_many :areas
	has_many :movimientos_equipo
	has_many :movimiento_insumo
end
