class MovimientoInsumo < ActiveRecord::Base
	belongs_to :responsable, :class_name => 'Persona'
	belongs_to :insumo
	belongs_to :tipo_movimiento
	belongs_to :laboratorio
end
