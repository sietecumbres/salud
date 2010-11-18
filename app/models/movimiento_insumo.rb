class MovimientoInsumo < ActiveRecord::Base
	belongs_to :responsable, :class_name => 'Persona'
end
