class MovimientoInsumo < ActiveRecord::Base
	belongs_to :responsable, :class_name => 'Persona'
	belongs_to :insumo
	belongs_to :tipo_movimiento
	belongs_to :laboratorio

	def self.get_balance(raw)
		balance = [0]
		self.get_transactions(raw).each do |movimiento|
			if movimiento.tipo_movimiento_id == 1
				balance << balance.last + movimiento.cantidad
			else
				balance << balance.last - movimiento.cantidad
			end
		end
		balance
	end
	
	def self.get_transactions(raw)
		MovimientoInsumo.joins("join insumos as i on i.id = movimiento_insumos.insumo_id inner join tipo_insumos as ti on ti.id = i.tipo_insumo_id").where("ti.id = ?", raw)
	end
	
	def self.sum_transactions(type, raw)
		MovimientoInsumo.joins("join insumos as i on i.id = movimiento_insumos.insumo_id inner join tipo_insumos as ti on ti.id = i.tipo_insumo_id").where("ti.id = ? AND movimiento_insumos.tipo_movimiento_id = ?", raw, type).sum('cantidad')
	end
	
	def self.total_transactions(raw)
		self.sum_transactions(1, raw) - self.sum_transactions(2, raw)
	end
	
end
