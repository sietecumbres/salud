class Insumo < ActiveRecord::Base
	belongs_to :tipo_insumo
	has_many :movimiento_insumos
  has_one :almacenamiento
	
	def self.days_remaining_closest_date(raw)
		least = Insumo.joins('join tipo_insumos ti on ti.id = insumos.tipo_insumo_id').where('ti.id = ? AND insumos.fecha_vencimiento >= ?', raw, Date.today).minimum('fecha_vencimiento')
		if least
			(least - Date.today).to_i
		else
			0
		end
	end

end
