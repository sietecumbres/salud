class MovimientoEquipo < ActiveRecord::Base
	order('created_at DESC')
	belongs_to :equipo
	belongs_to :laboratorio
	
	def transaction_type
		case
		when self.type == 'EntradaEquipo' then 'Entrada'
		when self.type == 'SalidaEquipo' then 'Salida'
		end
	end
end
