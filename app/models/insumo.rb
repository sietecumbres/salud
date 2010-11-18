class Insumo < ActiveRecord::Base
	belongs_to :tipo_insumo
	has_many :movimiento_insumos
end
