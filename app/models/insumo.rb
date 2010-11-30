class Insumo < ActiveRecord::Base
	belongs_to :tipo_insumo
	has_many :movimiento_insumos
  has_many :almacenamientos
	
	def self.days_remaining_closest_date(raw)
		(Insumo.joins('join tipo_insumos ti on ti.id = insumos.tipo_insumo_id').where('ti.id = ? AND insumos.fecha_vencimiento >= ?', raw, Date.today).minimum('fecha_vencimiento') - Date.today).to_i
	end

end
