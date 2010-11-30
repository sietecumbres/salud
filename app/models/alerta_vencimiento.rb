class	AlertaVencimiento < Alerta
	has_many :tipo_insumos
	
	def alert_level(raw)
		Insumo.days_remaining_closest_date(raw)
		"normal"
	end
end