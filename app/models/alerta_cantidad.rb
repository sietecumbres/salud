class AlertaCantidad < Alerta
	has_many :tipo_insumos
	
	def alert_level(raw)
		if self.cantidad_minima >= MovimientoInsumo.total_transactions(raw)
			'alert'
		else
			'normal'
		end
	end
	
end